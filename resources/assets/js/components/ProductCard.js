import React, { Component } from "react";

import ChoiceForm from "./ChoiceForm";
import ButtonIncrease from "./ButtonIncrease";
import ButtonDecrease from "./ButtonDecrease";

export default class ProductCard extends Component {
  constructor(props) {
    super(props);

    this.state = {
      btnSub: "",
      btnPlus: "",
      toggleChoiceForm: false,
      quantity: 0,
      isZoomInPic: false
    };

    this.increase = this.increase.bind(this);
    this.decrease = this.decrease.bind(this);
    this.makeChoice = this.makeChoice.bind(this);
    this.closeChoiceForm = this.closeChoiceForm.bind(this);
    this.getProductQtyInOrderList = this.getProductQtyInOrderList.bind(this);
    this.changePicSize = this.changePicSize.bind(this);
  }

  componentDidMount() {
    this.setState({
      btnPlus: "/table4/public/images/layout/btn_plus_red.png"
    });

    const flag =
      this.props.product.choices.length > 0 ||
      this.props.product.options.length > 0;
    const buttonImg = flag
      ? "/table4/public/images/layout/btn_sub_grey.png"
      : "/table4/public/images/layout/btn_sub_red.png";

    this.setState({ btnSub: buttonImg });
    if (this.props.mode !== "menu") {
      this.getProductQtyInOrderList(
        this.props.shoppingCartList,
        this.props.historyCartList
      );
    }
  }

  componentWillReceiveProps(newProps) {
    if (this.props.mode !== "menu") {
      this.getProductQtyInOrderList(
        newProps.shoppingCartList,
        newProps.historyCartList
      );
    }
  }

  getProductQtyInOrderList(arr, historyList) {
    let Qty = 0;
    arr.map(orderItem => {
      if (orderItem.item.product_id === this.props.product.product_id) {
        Qty += orderItem.quantity;
      }
    });
    if (historyList) {
      historyList.map(orderItem => {
        if (orderItem.item.product_id === this.props.product.product_id) {
          Qty += orderItem.quantity;
        }
      });
    }
    this.setState({ quantity: Qty });
  }

  makeChoice() {
    this.setState({ toggleChoiceForm: true });
  }

  closeChoiceForm() {
    this.setState({ toggleChoiceForm: false });
  }
  changePicSize() {
    this.setState({
      isZoomInPic: !this.state.isZoomInPic
    });
  }
  increase() {
    this.props.updateShoppingCartList(
      true,
      this.props.product,
      this.props.mode,
      "add",
      this.props.orderId,
      this.props.tableNumber
    );
  }

  decrease() {
    this.props.updateShoppingCartList(
      true,
      this.props.product,
      this.props.mode,
      "sub",
      this.props.orderId,
      this.props.tableNumber
    );
  }
  render() {
    const isSimpleProduct =
      this.props.product.options.length == 0 &&
      this.props.product.choices.length == 0
        ? true
        : false;

    const Control_Pannel =
      this.state.quantity > 0 ? (
        <div className="control-pannel">
          <div
            onClick={isSimpleProduct ? this.decrease : null}
            className="btn-sub"
          >
            <ButtonDecrease mode="fill" isDisable={true} />
          </div>
          <span className="number-quantity">{this.state.quantity}</span>
          <div
            onClick={isSimpleProduct ? this.increase : this.makeChoice}
            className="btn-plus"
          >
            <ButtonIncrease mode="fill" />
          </div>
        </div>
      ) : (
        <div className="control-pannel">
          <div
            onClick={isSimpleProduct ? this.increase : this.makeChoice}
            className="btn-plus-only"
          >
            <ButtonIncrease mode="fill" />
          </div>
        </div>
      );
    return (
      <div className="product-card">
        <div
          onClick={this.changePicSize}
          className={
            this.state.isZoomInPic ? "img-xl-container" : "img-container"
          }
        >
          <img
            src={`/table4/public/images/items/${this.props.product.image}`}
            alt={this.props.product.name}
          />
        </div>
        <div className="product-info">
          <div className="product-name">{this.props.product.name}</div>
          <div className="price-quantity">
            <div className="price">${this.props.product.price}</div>
            {this.props.mode !== "menu" ? Control_Pannel : null}
          </div>
        </div>
        {this.state.toggleChoiceForm ? (
          <ChoiceForm
            closeChoiceForm={this.closeChoiceForm}
            product={this.props.product}
            updateShoppingCartList={this.props.updateShoppingCartList}
            app_conf={this.props.app_conf}
            mode={this.props.mode}
            orderId={this.props.orderId}
            tableNumber={this.props.tableNumber}
          />
        ) : null}
      </div>
    );
  }
}
