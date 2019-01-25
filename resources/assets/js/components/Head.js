import React, { Component } from "react";

import Axios from "axios";

export default class Head extends Component {
  constructor(props) {
    super(props);
    this.changeLanguage = this.changeLanguage.bind(this);
  }

  changeLanguage() {
    if (
      this.props.mode === "table" ||
      (localStorage.getItem("preorderList") &&
        localStorage.getItem("preorderList").length == 0) ||
      !localStorage.getItem("preorderList")
    ) {
      const lang = localStorage.getItem("aupos_language_code");
      if (lang === "1") {
        localStorage.setItem("aupos_language_code", 2);
      } else {
        localStorage.setItem("aupos_language_code", 1);
      }
      window.location.reload();
    } else if (this.props.mode === "preorder") {
      const lang = localStorage.getItem("aupos_language_code");
      if (lang === "1") {
        localStorage.setItem("aupos_language_code", 2);
      } else {
        localStorage.setItem("aupos_language_code", 1);
      }

      if (
        localStorage.getItem("preorderList") &&
        localStorage.getItem("preorderList").length > 0
      ) {
        Axios.post("/table4/public/api/translate", {
          orderList: JSON.parse(localStorage.getItem("preorderList")),
          lang: localStorage.getItem("aupos_language_code")
        }).then(res => {
          localStorage.setItem(
            "preorderList",
            JSON.stringify(res.data.orderList)
          );
          window.location.reload();
        });
      }
    }
  }

  render() {
    return (
      <div className="head">
        <div className="left">{this.props.title}</div>
        <div className="right">
          {this.props.mode !== "menu" &&
          this.props.isShowLanguageSwitchButton ? (
            <span className="button" onClick={this.changeLanguage}>
              <span className="label">{this.props.btnLabel}</span>
            </span>
          ) : null}
        </div>
      </div>
    );
  }
}
