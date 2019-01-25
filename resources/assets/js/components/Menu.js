import React, { Component } from "react";

import Head from "./Head";

export default class Menu extends Component {
  constructor(props) {
    super(props);

    this.state = { productGroupList: [], categoryList: [], showErr: true };
    this.closeErrMsg = this.closeErrMsg.bind(this);
  }

  componentDidMount() {
    // Axios.get(`/table/public/api/products/1`).then(res => {
    //   this.setState({ productGroupList: res.data.products });
    // });
    // Axios.get(`/table/public/api/categories/1`).then(res => {
    //   this.setState({ categoryList: res.data.categories });
    // });
  }

  closeErrMsg() {
    this.setState({ showErr: false });
  }

  render() {
    return (
      <div className="order">
        <Head
          title={"Error"}
          mode={"menu"}
          btnLabel={this.props.app_conf.lang_switch_en}
        />
        {this.state.showErr ? <div className="menu-cover" /> : null}
        {this.state.showErr ? (
          <div className="menu-err-dialog">
            <div onClick={this.closeErrMsg} className="menu-close-button">
              X
            </div>
            <div className="menu-error-icon">
              <img src="/table4/public/images/layout/error.png" alt="" />
              <span className="menu-error-title">Sorry!</span>
            </div>
            <div className="menu-error-message">
              {this.props.match.params.message
                ? this.props.match.params.message
                : "This QR code is invalid.Please contact our staffs."}
            </div>
          </div>
        ) : null}
      </div>
    );
  }
}
