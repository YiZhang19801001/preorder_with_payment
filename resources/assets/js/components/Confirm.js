import React, { Component } from "react";
import { QRCode } from "react-qr-svg";
import { Link } from "react-router-dom";
import Axios from "axios";

import OrderItemCard from "./OrderItemCard";

export default class Confirm extends Component {
  constructor(props) {
    super(props);

    this.state = {
      qrString: "",
      shoppingCartList: [],
      orderId: "",
      tableId: "",
      isShowConfirm: false,
      paymentMethod: "",
      order_no: "",
      showQrCode: false,
      isLoading: false
    };

    this.createQrCode = this.createQrCode.bind(this);
    this.getOrderItemQuantityTotal = this.getOrderItemQuantityTotal.bind(this);
    this.getTotalPrice = this.getTotalPrice.bind(this);
    this.confirmOrder = this.confirmOrder.bind(this);
    this.payment = this.payment.bind(this);
    this.renderPayment = this.renderPayment.bind(this);
    this.handlePaymentMethodChange = this.handlePaymentMethodChange.bind(this);
  }

  componentDidMount() {
    if (
      this.props.mode === "preorder" &&
      localStorage.getItem("preorderList")
    ) {
      this.setState({
        shoppingCartList: JSON.parse(localStorage.getItem("preorderList"))
      });
    } else if (this.props.mode === "table") {
      this.setState({ shoppingCartList: this.props.shoppingCartList });
    }

    console.log(this.props.app_conf);

    Echo.channel("tableOrder").listen("UpdateOrder", e => {
      console.log("log event: ", e);
      console.log("state order_no: ", this.state.order_no);
      if (e.orderId == this.state.order_no) {
        //this.state.order_no
        if (e.action === "SUCCEEDED") {
          this.setState({ showQrCode: true, isLoading: false });
        }
      }
    });
  }

  componentWillReceiveProps(newProps) {
    if (newProps.mode === "table") {
      this.setState({ shoppingCartList: newProps.shoppingCartList });
    }
  }

  getOrderItemQuantityTotal() {
    let quantity = 0;

    this.state.shoppingCartList.map(orderItem => {
      quantity += orderItem.quantity;
    });

    return quantity;
  }

  createQrCode() {
    let qr = "=QROD=";
    if (
      this.state.shoppingCartList !== null ||
      this.state.shoppingCartList.length !== 0
    ) {
      this.state.shoppingCartList.forEach(el => {
        qr = qr + el.item.upc + ",";
        qr = qr + el.quantity + ",";
        qr = qr + "0" + ";";
        el.item.choices.forEach(choice => {
          if (choice.pickedChoice !== null) {
            choice.pickedChoice.forEach(ele => {
              qr = qr + ele.barcode + "," + el.quantity + "," + 0 + ";";
            });
          }
        });
        el.item.options.forEach(option => {
          qr = qr + option.option_name + "," + option.pickedOption + ",";
        });
        //qr = qr + "0" + ";";
      });
      this.QrValue = qr.substr(0, qr.length - 1);
    } else {
      this.QrValue = qr;
    }

    return qr;
  }

  getTotalPrice() {
    let sum = 0;

    this.state.shoppingCartList.map(orderItem => {
      sum += orderItem.quantity * orderItem.item.price;
    });

    return sum.toFixed(2);
  }

  confirmOrder() {
    Axios.post(`/table4/public/api/confirm`, {
      orderList: this.state.shoppingCartList,
      order_id: this.props.match.params.orderId,
      store_id: "4",
      store_name: "some store",
      store_url: "http://kidsnparty.com.au/table4/public",
      total: this.getTotalPrice(),
      paymentMethod: "Dive in",
      v: this.props.v,
      lang: this.props.lang,
      userId: this.props.userId
    })
      .then(res => {
        // todo:: set it to app.state
        this.props.updateHistoryCartList(res.data.historyList);
        this.props.history.push(
          `/table4/public/complete/${this.props.match.params.tableId}/${
            this.props.match.params.orderId
          }`
        );
      })
      .catch(err => {
        alert(err.reponse.data);
      });
  }

  handlePaymentMethodChange(e) {
    this.setState({ paymentMethod: e.target.value });
  }

  payment() {
    this.setState({ isLoading: true });
    var win = window.open("_blank");
    const today = new Date();
    const timestamps = Math.floor(today / 1000);
    const mchOrderNo = `123456789999666${Math.round(Math.random() * 1000)}`;
    Axios.post(`/redpay/public/api/payments/create`, {
      version: "1.0",
      mchNo: "77902",
      storeNo: "77911",
      mchOrderNo: mchOrderNo,
      channel: this.state.paymentMethod,
      payWay: "BUYER_SCAN_TRX_QRCODE",
      currency: "AUD",
      amount: this.getTotalPrice(),
      notifyUrl: "http://kidsnparty.com.au/table4/public/api/payment",
      returnUrl: "https://wap.redpayments.com.au/pay/success",
      item: "Clothes",
      quantity: 1,
      timestamp: timestamps,
      params: '{"buyerId":285502587945850268}',
      sign: "3598365168a172a2e62bdb14c104de9e"
    }).then(res => {
      // this.setState({ order_no: res.data.data.mchOrderNo });
      this.setState({ order_no: mchOrderNo });
      console.log(res.data);
      win.location = res.data.data.qrCode;
    });
  }

  renderPayment() {
    return (
      <div className="payment-section">
        <div className="payment-section__header">
          <span className="payment-section__header-text">
            {this.props.app_conf.payment_header_title}
          </span>
        </div>
        <div className="payment-section__body">
          <label className="payment-section__radio-label">
            <input
              type="radio"
              name="payment_method"
              value="ALIPAY"
              onChange={this.handlePaymentMethodChange}
            />
            <span className="payment-section__check-mark-wrapper">
              <img
                className="payment-section__body-img"
                src="/table4/public/images/alipay.png"
                alt=""
              />
            </span>
          </label>
          <label className="payment-section__radio-label">
            <input
              type="radio"
              name="payment_method"
              value="ALIPAY"
              onChange={this.handlePaymentMethodChange}
            />
            <span className="payment-section__check-mark-wrapper">
              <img
                className="payment-section__body-img"
                src="/table4/public/images/wechat.png"
                alt=""
              />
            </span>
          </label>
        </div>
        <div className="payment-section__footer">
          <button
            onClick={this.payment}
            className="payment-section__footer-button"
          >
            {this.props.app_conf.payment_button_label}
          </button>
        </div>
      </div>
    );
  }
  render() {
    const qr_section = (
      <div className="qrcode-section">
        <div className="qrcode-container">
          <QRCode
            bgColor="#FFFFFF"
            fgColor="#000000"
            level="Q"
            style={{ width: 180 }}
            value={this.createQrCode()}
          />
        </div>
        <div className="confirm__subtitle">
          {this.props.match.params.mode === "preorder"
            ? this.props.app_conf.preorder_qr_tips
            : this.props.app_conf.tableorder_qr_tips}
        </div>
      </div>
    );

    return (
      <div className="confirm">
        {this.state.isLoading ? (
          <div className="confirm__loading-cover">
            <div className="lds-ring">
              <div />
              <div />
              <div />
              <div />
            </div>
            <div className="payment-section__footer">
              <div
                onClick={() => {
                  this.setState({ isLoading: false });
                }}
                className="payment-section__footer-button"
              >
                Cancel
              </div>
            </div>
          </div>
        ) : null}
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
                <div
                  onClick={() => {
                    this.setState({ isShowConfirm: false });
                  }}
                  className="cancel-button"
                >
                  {this.props.app_conf.continue_order}
                </div>
                <div onClick={this.confirmOrder} className="confirm-button">
                  {this.props.app_conf.confirm_order}
                </div>
              </div>
            </div>
          </div>
        ) : null}
        {this.props.match.params.mode === "preorder" &&
        this.props.app_conf.withPayment &&
        this.state.showQrCode ? (
          <div className="confirm__title">
            <img src="/table4/public/images/layout/icon_confirm.png" alt="" />
            <span className="confirm__title-text">
              {this.props.app_conf.preorder_confirm_text}
            </span>
          </div>
        ) : null}

        {this.props.match.params.mode === "preorder" &&
        this.props.app_conf.withPayment === true &&
        !this.state.showQrCode
          ? this.renderPayment()
          : null}

        {this.props.match.params.mode === "preorder" &&
        this.props.app_conf.withPayment === true &&
        this.state.showQrCode
          ? qr_section
          : null}

        {this.props.match.params.mode === "preorder" &&
        !this.props.app_conf.withPayment
          ? qr_section
          : null}

        <div className="confirm__order-list__title">
          <span className="confirm__order-list__title-text">
            {this.props.app_conf.your_order_title}
          </span>
          <span className="confirm__order-list__quantity">
            <span className="confirm__order-list__quantity-title">
              {this.props.app_conf.quantity}
            </span>
            <span className="confirm__order-list__quantity-number">
              {this.getOrderItemQuantityTotal()}
            </span>
          </span>
        </div>
        <div className="confirm__order-list__container">
          {this.state.shoppingCartList.map((orderItem, index) => {
            return (
              <OrderItemCard
                orderItem={orderItem}
                mode={2}
                key={`orderItemInShoppingCart${index}`}
              />
            );
          })}
        </div>

        <div>
          <div className="confirm__order-list__total">
            <span className="confirm__order-list__total-title">
              {this.props.app_conf.confirm_total}
            </span>
            <span className="confirm__order-list__total-number">
              ${this.getTotalPrice()}
            </span>
          </div>

          <div className="confirm__back-button-container">
            <Link
              to={
                this.props.mode === "preorder"
                  ? `/table4/public/preorder`
                  : this.props.originPath
              }
              className="confirm__back-button"
            >
              {this.props.app_conf.continue_order}
            </Link>
          </div>
        </div>

        {this.props.match.params.mode === "table" ? (
          <div className="confirm__footer">
            <span className="confirm__footer__total">
              <span className="text">{this.props.app_conf.total}</span>
              <span className="number">${this.getTotalPrice()}</span>
            </span>
            <span className="confirm__footer__table-number">
              <span className="text">
                {this.props.app_conf.app_header_title}
              </span>
              <span className="number">{this.props.match.params.tableId}</span>
            </span>
            <span className="confirm__footer__order-number">
              <span className="text">{this.props.app_conf.order}</span>
              <span className="number">{this.props.match.params.orderId}</span>
            </span>
            <span
              onClick={() => {
                this.setState({ isShowConfirm: true });
              }}
              className="confirm__footer__button"
            >
              <span>{this.props.app_conf.confirm_order}</span>
            </span>
          </div>
        ) : null}
      </div>
    );
  }
}
