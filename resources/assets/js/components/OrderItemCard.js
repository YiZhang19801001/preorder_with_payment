import React, { Component } from "react";

import ButtonIncrease from "./ButtonIncrease";
import ButtonDecrease from "./ButtonDecrease";

export default class OrderItemCard extends Component {
  constructor(props) {
    super(props);

    this.state = { orderItem: this.props.orderItem };

    this.getTotalPrice = this.getTotalPrice.bind(this);
    this.increase = this.increase.bind(this);
    this.decrease = this.decrease.bind(this);
  }

  componentDidMount() {
    this.setState({ orderItem: this.props.orderItem });
  }

  componentWillReceiveProps(newProps) {
    this.setState({ orderItem: newProps.orderItem });
  }

  getTotalPrice() {
    let resPrice = this.state.orderItem.item.price;

    // this.state.orderItem.item.choices.map(choice)
    const totalPrice = resPrice * this.state.orderItem.quantity;
    return totalPrice.toFixed(2);
  }

  increase() {
    this.props.updateShoppingCartList(
      true,
      this.state.orderItem.item,
      this.props.appMode,
      "add",
      this.props.orderId,
      this.props.tableNumber
    );
  }

  decrease() {
    this.props.updateShoppingCartList(
      true,
      this.state.orderItem.item,
      this.props.appMode,
      "sub",
      this.props.orderId,
      this.props.tableNumber
    );
  }

  render() {
    const Control_Pannel =
      this.props.mode === 1 ? (
        <div className="order-item-card__quantity-control">
          <span
            onClick={this.decrease}
            className="order-item-card__quantity-control__decrease"
          >
            <ButtonDecrease mode="outline" />
          </span>
          <span className="order-item-card__quantity-control__quantity">
            {this.state.orderItem.quantity}
          </span>
          <span
            onClick={this.increase}
            className="order-item-card__quantity-control__increase"
          >
            <ButtonIncrease mode="outline" />
          </span>
        </div>
      ) : (
        <div className="order-item-card__quantity-display">
          <span>X{this.state.orderItem.quantity}</span>
        </div>
      );
    return (
      <div className="order-item-card">
        {this.props.mode !== 3 ? (
          <div className="order-item-card__img-container">
            <img
              src={`/table4/public/images/items/${
                this.state.orderItem.item.image
              }`}
              alt=""
            />
          </div>
        ) : null}
        <div className="order-item-card__info-container">
          <span className="order-item-card__item-name">
            {this.state.orderItem.item.name}
          </span>
          {this.state.orderItem.item.choices.map((choice, index) => {
            return (
              <div
                className="order-item-card__choices"
                key={`orderItemChoiceInShoppingCart${index}`}
              >
                <div className="order-item-card__choices__type">
                  {choice.type}
                </div>
                {choice.pickedChoice !== null
                  ? choice.pickedChoice.map((pickedchoice, index) => {
                      return (
                        <div
                          key={`decodePickedChoice${index}`}
                          className="order-item-card__choices__pickedChoice"
                        >
                          <span className="order-item-card__choices__pickedChoice-name">
                            {pickedchoice.name}
                          </span>
                          <span className="order-item-card__choices__pickedChoice-price">
                            ${pickedchoice.price}
                          </span>
                        </div>
                      );
                    })
                  : null}
              </div>
            );
          })}
          {this.state.orderItem.item.options.map((option, index) => {
            return (
              <div key={`orderItemOptionInShoppingCart${index}`}>
                <div>{option.type}</div>
                <div>{option.pickedOption}</div>
              </div>
            );
          })}
        </div>
        {this.props.mode !== 3 ? (
          <div className="order-item-card__quantity-control-container">
            {Control_Pannel}
          </div>
        ) : null}
        {this.props.mode !== 3 ? (
          <div className="order-item-card__total-price-container">
            <div className="order-item-card__total-price">
              ${this.getTotalPrice()}
            </div>
          </div>
        ) : null}
        {this.props.mode === 3 ? (
          <div className="order-item-card__mode-3-pannel">
            <div className="mode-3-pannel__left">
              <div className="title">{this.props.app_conf.order_label}</div>
              <div className="number">{this.state.orderItem.quantity}</div>
            </div>
            <div className="mode-3-pannel__right">
              <div className="title">{this.props.app_conf.total}</div>
              <div className="number">{this.getTotalPrice()}</div>
            </div>
          </div>
        ) : null}
      </div>
    );
  }
}
