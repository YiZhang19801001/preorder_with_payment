import React, { Component } from "react";

export default class ButtonDecrease extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div
        className={`button-decrease ${this.props.mode} ${
          this.props.isDisable ? "disable" : ""
        }`}
      >
        <i className="material-icons">{"remove"}</i>
      </div>
    );
  }
}
