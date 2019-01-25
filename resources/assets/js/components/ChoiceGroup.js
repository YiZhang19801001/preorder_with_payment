import React, { Component } from "react";

export default class ChoiceGroup extends Component {
  constructor(props) {
    super(props);

    this.state = {
      choiceClass: {
        contentWrap: "",
        checkMarkWrapper: "",
        checkMark: "",
        iconCover: "",
        choiceInfo: ""
      },
      isListView: true
    };
    this.setChoice = this.setChoice.bind(this);
    this.toggleListView = this.toggleListView.bind(this);
  }

  componentWillMount() {
    this.setState({
      choiceClass: {
        contentWrapper: "choice-group__content-wrapper-listview",
        checkMarkWrap: "checkmark-wrap-listview",
        checkMark: "checkmark-listview",
        iconCover: "choice-group__icon-cover-listview",
        choiceInfo: "choice-group__choice-info-listview"
      },
      isListView: this.props.isListView ? this.props.isListView : true
    });
  }

  componentWillReceiveProps(newProps) {
    if (this.state.isListView !== newProps.isListView) {
      this.setState({ isListView: newProps.isListView });
      this.toggleListView();
    }
  }

  setChoice(e) {
    this.props.updateOrderItemChoice(
      JSON.parse(e.target.value),
      e.target.checked
    );
  }

  toggleListView() {
    if (this.state.isListView === true) {
      this.setState({
        choiceClass: {
          contentWrapper: "choice-group__content-wrapper",
          checkMarkWrap: "checkmark-wrap",
          checkMark: "checkmark",
          iconCover: "choice-group__icon-cover",
          choiceInfo: "choice-group__choice-info"
        },
        isListView: false
      });
    } else {
      this.setState({
        choiceClass: {
          contentWrapper: "choice-group__content-wrapper-listview",
          checkMarkWrap: "checkmark-wrap-listview",
          checkMark: "checkmark-listview",
          iconCover: "choice-group__icon-cover-listview",
          choiceInfo: "choice-group__choice-info-listview"
        },
        isListView: true
      });
    }
  }

  render() {
    // const imgSrc = `url("/table/public/images/items/${this.props.imgSrc}")`;
    return (
      <div className="choice-group">
        <div className="choice-group__title">{this.props.choiceGroup.type}</div>
        <div className="choice-group__subtitle">
          {this.props.app_conf.choice_form_title}
        </div>
        <div className="choice-group__content">
          {this.props.choiceGroup.choices.map((choice, index) => {
            return (
              <div
                key={`choiceTag${index}`}
                className={this.state.choiceClass.contentWrapper}
              >
                <label className="choice-group__content-container">
                  <input
                    type="checkbox"
                    name={this.props.choiceGroup.type}
                    value={JSON.stringify(choice)}
                    onChange={this.setChoice}
                  />
                  <span className={this.state.choiceClass.checkMarkWrap}>
                    <span
                      className={this.state.choiceClass.checkMark}
                      style={{
                        backgroundImage: `url("/table4/public/images/items/${
                          choice.image
                        }")`
                      }}
                    />
                    <div className={this.state.choiceClass.iconCover} />
                  </span>
                </label>
                <span className={this.state.choiceClass.choiceInfo}>
                  <span className="choice-group__choice-name">
                    {choice.name}
                  </span>
                  <span className="choice-group__choice-price">
                    {parseInt(choice.price) === 0 ? "free" : choice.price}
                  </span>
                </span>
              </div>
            );
          })}
        </div>
      </div>
    );
  }
}
