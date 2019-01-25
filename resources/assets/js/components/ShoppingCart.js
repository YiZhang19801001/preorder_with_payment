import React, { Component } from "react";
import { Link } from "react-router-dom";
import Axios from "axios";

import OrderItemCard from "./OrderItemCard";

export default class ShoppingCart extends Component {
  constructor(props) {
    super(props);

    this.state = {
      shoppingCartIconImage: "",
      shoppingCartList: [],
      orderShoppingCartList: [],
      historyCartList: [],
      expand: false,
      isShowConfirm: false
    };

    this.getOrderTotalPrice = this.getOrderTotalPrice.bind(this);
    this.getOrderTotalQuantity = this.getOrderTotalQuantity.bind(this);
    this.showOrderList = this.showOrderList.bind(this);
    this.closeOrderList = this.closeOrderList.bind(this);
    this.toggleOrderList = this.toggleOrderList.bind(this);
    this.clearPreorderShoppingCart = this.clearPreorderShoppingCart.bind(this);
  }

  componentWillMount() {
    // console.log(this.state);
  }

  /**
   * did mount method do fellowing tasks
   * 1. set init state for shoppingCartIconImage and shoppingCartList
   * 2. render shoppingCartList according to app mode [preorder/table]
   * 3. update app.js.state.shoppingCartList by call [updateOrderList()]
   * 4. set up channel if in table mode
   */
  componentDidMount() {
    this.setState({
      shoppingCartIconImage:
        "/table4/public/images/layout/shopping_cart_icon.png",
      shoppingCartList: this.props.shoppingCartList
    });

    if (this.props.mode === "preorder") {
      if (localStorage.getItem("preorderList")) {
        this.setState({
          shoppingCartList: JSON.parse(localStorage.getItem("preorderList"))
        });

        this.props.updateOrderList(
          JSON.parse(localStorage.getItem("preorderList"))
        );
      }
    } else if (this.props.mode === "table") {
      Axios.post(`/table4/public/api/initcart`, {
        order_id: this.props.orderId,
        cdt: this.props.cdt,
        v: this.props.v,
        table_id: this.props.tableNumber,
        lang: localStorage.getItem("aupos_language_code")
      })
        .then(res => {
          // this.setState({ shoppingCartList: res.data.pending_list });
          this.props.updateOrderList(res.data.pendingList);
          this.props.updateHistoryCartList(res.data.historyList);
          // this.setState({ orderShoppingCartList: res.data.ordered_list });
        })
        .catch(err => {
          this.props.redirectToMenu(err.response.data.message);
        });

      Echo.channel("tableOrder").listen("UpdateOrder", e => {
        if (e.orderId == this.props.orderId && e.userId !== this.props.userId) {
          if (e.action == "update") {
            Axios.post(`/table4/public/api/initcart`, {
              order_id: this.props.orderId,
              cdt: this.props.cdt,
              v: this.props.v,
              table_id: this.props.tableNumber,
              lang: localStorage.getItem("aupos_language_code")
            })
              .then(res => {
                // this.setState({ shoppingCartList: res.data.pending_list });
                this.props.updateOrderList(res.data.pendingList);
                this.props.updateHistoryCartList(res.data.historyList);
                // this.setState({ orderShoppingCartList: res.data.ordered_list });
              })
              .catch(err => {
                window.location.reload();
              });
          } else {
            this.props.updateShoppingCartList(
              false,
              e.orderItem,
              "table",
              e.action,
              this.props.orderId,
              this.props.tableNumber
            );
          }
        }
      });
    }
  }

  componentWillReceiveProps(newProps) {
    this.setState({
      shoppingCartList: newProps.shoppingCartList
    });

    if (this.props.mode === "table") {
      this.setState({ historyCartList: newProps.historyCartList });
    }
  }

  /**
   * calculate the total amount of current shopping order
   */
  getOrderTotalPrice() {
    let sum = 0;
    if (this.state.shoppingCartList.length > 0) {
      this.state.shoppingCartList.forEach(orderItem => {
        sum += orderItem.item.price * orderItem.quantity;
      });
    }
    if (this.state.historyCartList.length > 0) {
      this.state.historyCartList.forEach(orderItem => {
        sum += orderItem.item.price * orderItem.quantity;
      });
    }
    return sum.toFixed(2);
  }

  clearPreorderShoppingCart() {
    this.props.clearPreorderShoppingCart();
  }

  /**
   * calculate the total quantity of current shopping order
   */
  getOrderTotalQuantity() {
    let quantity = 0;
    if (this.state.shoppingCartList.length > 0) {
      this.state.shoppingCartList.forEach(orderItem => {
        quantity += orderItem.quantity;
      });
    }

    if (this.state.historyCartList.length > 0) {
      this.state.historyCartList.forEach(orderItem => {
        quantity += orderItem.quantity;
      });
    }
    return quantity;
  }

  /**
   * toggle the order list details show/not show
   */
  showOrderList() {
    this.setState({ expand: true });
  }

  closeOrderList() {
    this.setState({ expand: false });
  }

  toggleOrderList() {
    this.setState({ expand: !this.state.expand });
  }

  render() {
    const Order_List =
      this.props.mode === "preorder" ? (
        <div className="shopping-cart__list-container">
          {this.state.shoppingCartList.map((orderItem, index) => {
            return (
              <OrderItemCard
                orderItem={orderItem}
                updateShoppingCartList={this.props.updateShoppingCartList}
                increaseShoppingCartItem={this.props.increaseShoppingCartItem}
                decreaseShoppingCartItem={this.props.decreaseShoppingCartItem}
                appMode={this.props.mode}
                orderId={this.props.orderId}
                tableNumber={this.props.tableNumber}
                key={`orderItemInShoppingCart${index}`}
                mode={1}
              />
            );
          })}
        </div>
      ) : (
        <div className="shopping-cart__list-container">
          {this.state.shoppingCartList.map((orderItem, index) => {
            return (
              <OrderItemCard
                orderItem={orderItem}
                appMode={this.props.mode}
                orderId={this.props.orderId}
                tableNumber={this.props.tableNumber}
                updateShoppingCartList={this.props.updateShoppingCartList}
                increaseShoppingCartItem={this.props.increaseShoppingCartItem}
                decreaseShoppingCartItem={this.props.decreaseShoppingCartItem}
                key={`orderItemInShoppingCart${index}`}
                mode={1}
              />
            );
          })}
          {this.state.historyCartList.map((orderItem, index) => {
            return (
              <OrderItemCard
                app_conf={this.props.app_conf}
                orderItem={orderItem}
                key={`historyItemInShoppingCart${index}`}
                mode={3}
              />
            );
          })}
        </div>
      );

    return (
      <div>
        {this.state.isShowConfirm ? (
          <div className="confirm-modal">
            <div className="order-confirm-dialog">
              <div className="order-confirm-icon">
                <img src="/table4/public/images/layout/error.png" alt="" />
                <span className="order-confirm-title">
                  Order will be Submit!
                </span>
              </div>
              <div className="order-confirm-message">
                {`Are you sure to submit this order!`}
              </div>
              <div className="button-pannel">
                <div className="cancel-button">
                  {this.props.app_conf.continue_order}
                </div>
                <div className="confirm-button">
                  {this.props.app_conf.confirm_order}
                </div>
              </div>
            </div>
          </div>
        ) : null}
        {this.state.expand ? (
          <div onClick={this.closeOrderList} className="shopping-cart__cover" />
        ) : null}
        <div className="shopping-cart">
          <div onClick={this.toggleOrderList} className="shopping-cart__header">
            <div className="shopping-cart__header__left-section">
              <img src={this.state.shoppingCartIconImage} alt="shopping cart" />
              {this.getOrderTotalQuantity() > 0 ? (
                <span className="shopping-cart__header__quantity">
                  {this.getOrderTotalQuantity()}
                </span>
              ) : null}
            </div>
            <div className="shopping-cart__header__right-section">
              <span className="shopping-cart__header__total-title">
                {this.props.app_conf.total}
              </span>
              <span className="shopping-cart__header__total-price">
                ${this.getOrderTotalPrice()}
              </span>
            </div>
          </div>

          {this.state.expand ? Order_List : null}

          {this.state.expand ? (
            <div className="order-item-card__confirm-button-container">
              {this.props.mode === "preorder" ? (
                <div
                  className="order-item__clear-button"
                  onClick={this.clearPreorderShoppingCart}
                >
                  {this.props.app_conf.clear_localStorage}
                </div>
              ) : null}
              <Link
                to={
                  this.props.mode === "preorder"
                    ? `/table4/public/confirm/${this.props.mode}`
                    : `/table4/public/confirm/${this.props.mode}/${
                        this.props.tableNumber
                      }/${this.props.orderId}`
                }
                className="order-item-card__confirm-button"
              >
                {this.props.app_conf.confirm_order}
              </Link>
            </div>
          ) : null}
        </div>
      </div>
    );
  }
}
