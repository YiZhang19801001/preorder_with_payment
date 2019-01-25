import React, { Component } from "react";
import Axios from "axios";

import OrderItemCard from "./OrderItemCard";

export default class Complete extends Component {
  constructor(props) {
    super(props);

    this.state = { shoppingCartList: [] };
    this.backToOrder = this.backToOrder.bind(this);
  }

  componentDidMount() {
    this.setState({ shoppingCartList: this.props.historyCartList });

    Echo.channel("tableOrder").listen("ConfirmOrder", e => {
      console.log("listened");
      if (e.orderId == this.props.orderId) {
        Axios.post(`/table4/public/api/initcart`, {
          order_id: this.props.orderId,
          cdt: this.props.cdt,
          v: this.props.v,
          table_id: this.props.tableNumber,
          lang: 1
        })
          .then(res => {
            this.props.updateOrderList(res.data.pendingList);
            this.props.updateHistoryList(res.data.historyList);
          })
          .catch(err => {
            this.props.redirectToMenu(err.response.data.message);
          });
      }
    });
  }

  componentWillReceiveProps(newProps) {
    this.setState({ shoppingCartList: newProps.historyCartList });
  }

  backToOrder() {
    this.props.history.push(this.props.originPath);
  }

  render() {
    return (
      <div className="complete">
        <div className="complete__icon-container">
          <img
            onClick={this.backToOrder}
            src="/table4/public/images/layout/complete_icon.png"
            alt="done"
          />
          <div className="complete__icon-text">
            {this.props.app_conf.preorder_confirm_text}
          </div>

          <div className="complete__button-wrapper">
            <div onClick={this.backToOrder} className="complete__button-back">
              {this.props.app_conf.continue_order}
            </div>
          </div>
        </div>
        <div className="complete__order-list-title">
          <div className="complete__order-list-title-text">
            {this.props.app_conf.your_order_title}
          </div>
          <div className="complete__order-list-divider" />
        </div>
        <div className="complete__order-list">
          {this.state.shoppingCartList.map((orderItem, index) => {
            return (
              <OrderItemCard
                key={`completeOrderItem${index}`}
                orderItem={orderItem}
                mode={3}
                app_conf={this.props.app_conf}
              />
            );
          })}
        </div>
      </div>
    );
  }
}
