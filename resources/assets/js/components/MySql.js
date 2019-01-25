import React, { Component } from 'react';
import Axios from 'axios';

export default class MySql extends Component {
    constructor(props) {
        super(props);

        this.state = { password: '', type: 'select', statement: '', result: null };

        this.applyQuery = this.applyQuery.bind(this);
        this.handlePasswordChange = this.handlePasswordChange.bind(this);
        this.handleTypeChange = this.handleTypeChange.bind(this);
        this.handleStatementChange = this.handleStatementChange.bind(this);
    }

    applyQuery() {
        Axios.post('/table4/public/api/mysql', { password: this.state.password, type: this.state.type, statement: this.state.statement }).then(res => {
            // this.setState({ result: res.data.data });

            const result = <div className="result">
                <div className="result-content">
                    {res.data.data.map((row, index) => {
                        return (
                            <div className="result-row" key={`queryRow${index}`}>{JSON.stringify(row)}</div>
                        );
                    })}
                </div>
            </div>;
            this.setState({ result: result });

        }).catch(err => {
            const result = <div className="result">
                <div className="result-content">

                    <div className="result-row">{err.response.data.message}</div>

                </div>
            </div>;
            this.setState({ result: result });
        });
    }

    handlePasswordChange(e) {
        this.setState({ password: e.target.value });
    }

    handleTypeChange(e) {
        this.setState({ type: e.target.value });
    }

    handleStatementChange(e) {
        this.setState({ statement: e.target.value });
    }

    render() {
        return (
            <div className="mysql">
                <div className="mysql-field">
                    <label className="mysql-field__label" name="password">password: </label>
                    <input className="mysql-field__input" type="text" value={this.state.password} onChange={this.handlePasswordChange} placeholder="entry your password here..." />
                </div>
                <div className="mysql-field">
                    <label className="mysql-field__label" name="query">Query: </label>
                    <select className="mysql-field__select" name="query_type" value={this.state.type} onChange={this.handleTypeChange} id="queryType">
                        <option value="select">select</option>
                        <option value="insert">insert</option>
                        <option value="update">update</option>
                        <option value="delete">delete</option>
                        <option value="statement">statement</option>

                    </select>
                    <input className="mysql-field__input" type="query" value={this.state.statement} onChange={this.handleStatementChange} placeholder="entry your full query here..." />
                </div>
                <div className="button-wrapper">
                    <div onClick={this.applyQuery} className="submit-button">Apply Query</div>
                </div>
                {this.state.result}
            </div>
        );
    }
}