/**
 * First we will load all of this project's JavaScript dependencies which
 * includes React and other helpers. It's a great starting point while
 * building robust, powerful web applications using React + Laravel.
 */

require("./bootstrap");

/**
 * Next, we will create a fresh React component instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

import ReactDom from "react-dom";
import React, { Component } from "react";
import { Route, BrowserRouter as Router, Switch } from "react-router-dom";
import Axios from "axios";

import Order from "./components/Order";
import Confirm from "./components/Confirm";
import Menu from "./components/Menu";
import Complete from "./components/Complete";
import MySql from "./components/MySql";
import Setting from "./components/Setting";

export default class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      shoppingCartList: [],
      historyCartList: [],
      app_conf: {},
      tableId: "",
      orderId: "",
      userId: "",
      originPath: "",
      v: "",
      cdt: "",
      lang: null
    };

    this.updateShoppingCartList = this.updateShoppingCartList.bind(this);
    this.increaseShoppingCartItem = this.increaseShoppingCartItem.bind(this);
    this.decreaseShoppingCartItem = this.decreaseShoppingCartItem.bind(this);
    this.refreshStateShoppingCartList = this.refreshStateShoppingCartList.bind(
      this
    );
    this.updateOrderList = this.updateOrderList.bind(this);
    this.setOriginPath = this.setOriginPath.bind(this);
    this.setV = this.setV.bind(this);
    this.setCdt = this.setCdt.bind(this);
    this.updateHistoryCartList = this.updateHistoryCartList.bind(this);
    this.clearPreorderShoppingCart = this.clearPreorderShoppingCart.bind(this);
  }

  componentWillMount() {
    Axios.get(
      `/table4/public/api/init/${localStorage.getItem("aupos_language_code")}`
    ).then(res => {
      this.setState({
        app_conf: res.data.app_conf,
        userId: res.data.userId
      });
      if (localStorage.getItem("aupos_language_code")) {
        this.setState({ lang: localStorage.getItem("aupos_language_code") });
      } else {
        localStorage.setItem(
          "aupos_laguage_code",
          res.data.app_conf.default_language
        );
      }
    });
  }
  componentDidMount() {
    if (localStorage.getItem("aupos_time_stamp")) {
      const today = new Date();
      const date = `${today.getFullYear()}${today.getMonth() +
        1}${today.getDate()}`;
      const time = localStorage.getItem("aupos_time_stamp");

      if (time != date) {
        this.clearPreorderShoppingCart();
      }
    }
  }

  updateHistoryCartList(list) {
    this.setState({ historyCartList: list });
  }
  setOriginPath(path) {
    this.setState({ originPath: path });
  }

  /**
   * retreive order list data from database
   *
   */
  updateOrderList(orderList) {
    this.setState({ shoppingCartList: orderList });
  }

  /**
   * add a new item into the order list
   * 1. preorder mode: only store in localstorage["aupos_preorder"]
   * 2. table order mode: save to data base temp table and then send a modify broadcast into channel
   *
   * @param {product} item
   */
  updateShoppingCartList(isCallApi, item, mode, action, orderId, tableId) {
    let resultArr = [];
    if (action === "add") {
      let flag = false;
      resultArr = this.state.shoppingCartList.map(orderItem => {
        if (_.isEqual(orderItem.item, item)) {
          flag = true;
          return { ...orderItem, quantity: orderItem.quantity + 1 };
        } else {
          return orderItem;
        }
      });

      if (!flag) {
        resultArr = [
          ...this.state.shoppingCartList,
          { item: item, quantity: 1 }
        ];
      }
    } else if (action === "sub") {
      const arr = this.state.shoppingCartList.map(orderItem => {
        if (_.isEqual(orderItem.item, item)) {
          return { ...orderItem, quantity: orderItem.quantity - 1 };
        } else {
          return orderItem;
        }
      });

      resultArr = arr.filter(ele => ele.quantity > 0);
    }

    this.setState({ shoppingCartList: resultArr });

    this.refreshStateShoppingCartList(
      isCallApi,
      mode,
      action,
      item,
      orderId,
      tableId,
      resultArr
    );
  }
  setV(v) {
    this.setState({ v });
  }
  setCdt(cdt) {
    this.setState({ cdt });
  }
  /**
   * incease quantity of an order item in the shopping cart
   *
   * @param {int} index - position of this order item in the shopping cart list
   */
  increaseShoppingCartItem(index) {
    this.state.shoppingCartList[index].quantity++;
    this.refreshStateShoppingCartList();
  }

  /**
   * decrease quantity of an order item in the shopping cart, if after decrement the quantity equal to 0 then delete this record entirely
   *
   * @param {int} index - position of this order item in the shopping cart list
   */
  decreaseShoppingCartItem(index) {
    if (this.state.shoppingCartList[index].quantity > 1) {
      this.state.shoppingCartList[index].quantity--;
    } else {
      this.state.shoppingCartList.splice(index, 1);
    }

    this.refreshStateShoppingCartList();
  }

  clearPreorderShoppingCart() {
    localStorage.setItem("preorderList", []);
    this.setState({ shoppingCartList: [] });
  }

  /**
   * update order list use setState method to update the list in all relative components
   */
  refreshStateShoppingCartList(
    isCallApi,
    mode,
    action,
    item,
    orderId,
    tableId,
    resultArr
  ) {
    if (mode === "preorder") {
      localStorage.setItem("preorderList", JSON.stringify(resultArr));
      const today = new Date();
      const date = `${today.getFullYear()}${today.getMonth() +
        1}${today.getDate()}`;
      localStorage.setItem("aupos_time_stamp", date);
    } else if (mode === "table" && isCallApi === true) {
      Axios.post("/table4/public/api/updateorderlist", {
        action: action,
        orderItem: item,
        userId: this.state.userId,
        orderId: orderId,
        tableId: tableId
      });
    }
  }

  render() {
    return (
      <Router>
        <Switch>
          <Route
            exact
            path="/table4/public/preorder"
            render={props => (
              <Order
                updateShoppingCartList={this.updateShoppingCartList}
                shoppingCartList={this.state.shoppingCartList}
                app_conf={this.state.app_conf}
                increaseShoppingCartItem={this.increaseShoppingCartItem}
                decreaseShoppingCartItem={this.decreaseShoppingCartItem}
                updateOrderList={this.updateOrderList}
                lang={this.state.lang}
                mode={"preorder"}
                clearPreorderShoppingCart={this.clearPreorderShoppingCart}
                {...props}
              />
            )}
          />
          <Route
            exact
            path="/table4/public/table/:table/orderid/:orderid"
            render={props => (
              <Order
                updateShoppingCartList={this.updateShoppingCartList}
                shoppingCartList={this.state.shoppingCartList}
                app_conf={this.state.app_conf}
                increaseShoppingCartItem={this.increaseShoppingCartItem}
                decreaseShoppingCartItem={this.decreaseShoppingCartItem}
                setOrderId={this.setOrderId}
                setTableId={this.setTableId}
                mode={"table"}
                updateOrderList={this.updateOrderList}
                userId={this.state.userId}
                setOriginPath={this.setOriginPath}
                lang={this.state.lang}
                setV={this.setV}
                setCdt={this.setCdt}
                updateHistoryCartList={this.updateHistoryCartList}
                historyCartList={this.state.historyCartList}
                clearPreorderShoppingCart={this.clearPreorderShoppingCart}
                {...props}
              />
            )}
          />
          <Route
            exact
            path="/table4/public/confirm/:mode"
            render={props => (
              <Confirm
                shoppingCartList={this.state.shoppingCartList}
                app_conf={this.state.app_conf}
                mode={"preorder"}
                lang={this.state.lang}
                userId={this.state.userId}
                {...props}
              />
            )}
          />
          <Route
            exact
            path="/table4/public/confirm/:mode/:tableId/:orderId"
            render={props => (
              <Confirm
                shoppingCartList={this.state.shoppingCartList}
                app_conf={this.state.app_conf}
                mode={"table"}
                updateHistoryCartList={this.updateHistoryCartList}
                originPath={this.state.originPath}
                v={this.state.v}
                lang={this.state.lang}
                userId={this.state.userId}
                {...props}
              />
            )}
          />
          <Route
            exact
            path="/table4/public/complete/:tableId/:orderId"
            render={props => (
              <Complete
                shoppingCartList={this.state.shoppingCartList}
                app_conf={this.state.app_conf}
                mode={"table"}
                originPath={this.state.originPath}
                historyCartList={this.state.historyCartList}
                userId={this.state.userId}
                lang={this.state.lang}
                v={this.state.v}
                userId={this.state.userId}
                orderId={this.state.orderId}
                cdt={this.state.cdt}
                tableNumber={this.state.tableId}
                {...props}
              />
            )}
          />
          <Route
            exact
            path="/table4/public/mysql"
            render={props => <MySql {...props} />}
          />
          <Route
            exact
            path="/table4/public/mycon"
            render={props => (
              <Setting app_conf={this.state.app_conf} {...props} />
            )}
          />
          <Route
            exact
            path="/table4/public/menu/:message"
            render={props => <Menu app_conf={this.state.app_conf} {...props} />}
          />
          <Route
            render={props => <Menu app_conf={this.state.app_conf} {...props} />}
          />
        </Switch>
      </Router>
    );
  }
}

if (document.getElementById("root")) {
  ReactDom.render(<App />, document.getElementById("root"));
}
