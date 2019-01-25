import React, { Component } from "react";
import Axios from "axios";

export default class Setting extends Component {
  constructor(props) {
    super(props);

    this.state = {
      theme: "",
      preorderTitleCn: "",
      preorderTitleEn: ""
    };

    this.setChoice = this.setChoice.bind(this);
    this.apply = this.apply.bind(this);
    this.handlepreorderTitleEnChange = this.handlepreorderTitleEnChange.bind(
      this
    );
    this.handlepreorderTitleCnChange = this.handlepreorderTitleCnChange.bind(
      this
    );
    this.applyText = this.applyText.bind(this);
  }

  componentWillMount() {
    Axios.get("/table4/public/api/init/1").then(res => {
      this.setState({ preorderTitleCn: res.data.app_conf.preorder_title });
    });
    Axios.get("/table4/public/api/init/2").then(res => {
      this.setState({ preorderTitleEn: res.data.app_conf.preorder_title });
    });
  }
  componentDidMount() {
    if (this.props.app_conf) {
      this.setState({
        theme: this.props.app_conf.default_theme
          ? this.props.app_conf.default_theme
          : "light"
      });
    }
  }
  setChoice(e) {
    this.setState({ theme: e.target.value });
  }

  apply() {
    Axios.get(`/table4/public/api/test/${this.state.theme}`).then(res => {
      alert(res.data.message);
    });
  }

  handlepreorderTitleCnChange(e) {
    this.setState({ preorderTitleCn: e.target.value });
  }

  handlepreorderTitleEnChange(e) {
    this.setState({ preorderTitleEn: e.target.value });
  }

  applyText() {
    const cn = this.state.preorderTitleCn;
    const en = this.state.preorderTitleEn;
    Axios.post(`/table4/public/api/language`, {
      preorder_title_cn: cn,
      preorder_title_en: en
    }).then(res => {
      alert(res.data.message);
    });
  }

  render() {
    return (
      <div className="setting">
        <div className="setting__sub-header">
          {this.props.app_conf.setting_theme}
        </div>
        <div className="setting__choice-pannel">
          <div className="theme-setting-item">
            <label className="theme-setting-container">
              <input
                type="radio"
                name="theme"
                value="light"
                onChange={this.setChoice}
              />
              <span className="checkmark-wrap">
                <div className="choice-group__icon-cover" />
              </span>
            </label>
            <span className="choice-group__choice-info">
              <span className="theme-setting-name">light</span>
            </span>
          </div>
          <img
            src="/table4/public/images/layout/theme_light.jpg"
            className="theme_pic"
            alt="light theme"
          />
        </div>
        <div className="setting__choice-pannel">
          <div className="theme-setting-item">
            <label className="theme-setting-container">
              <input
                type="radio"
                name="theme"
                value="dark"
                onChange={this.setChoice}
              />
              <span className="checkmark-wrap">
                <div className="choice-group__icon-cover" />
              </span>
            </label>
            <span className="choice-group__choice-info">
              <span className="theme-setting-name">dark</span>
            </span>
          </div>
          <img
            src="/table4/public/images/layout/theme_dark.png"
            className="theme_pic"
            alt="dark theme"
          />
        </div>
        <div className="apply-button" onClick={this.apply}>
          Apply Theme
        </div>
        <div className="mysql">
          <div className="mysql-field">
            <label className="mysql-field__label" name="preorderTitleCn">
              preorder title(cn):
            </label>
            <input
              className="mysql-field__input"
              type="text"
              value={this.state.preorderTitleCn}
              onChange={this.handlepreorderTitleCnChange}
            />
            <label className="mysql-field__label" name="preorderTitleEn">
              preorder title(en):
            </label>
            <input
              className="mysql-field__input"
              type="text"
              value={this.state.preorderTitleEn}
              onChange={this.handlepreorderTitleEnChange}
            />
          </div>
        </div>
        <div className="apply-button" onClick={this.applyText}>
          Apply Text
        </div>
      </div>
    );
  }
}
