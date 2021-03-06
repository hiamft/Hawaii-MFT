import React, { Component } from 'react';
import { connect } from 'react-redux';

import Button from "react-bootstrap/Button";
import Form from 'react-bootstrap/Form';
import FormControl from 'react-bootstrap/FormControl';

import "../App/App.css";


class LoginPage extends Component {
  state = {
    username: '',
    password: '',
  };

  login = (event) => {
    event.preventDefault();

    if (this.state.username && this.state.password) {
      this.props.dispatch({
        type: 'LOGIN',
        payload: {
          username: this.state.username,
          password: this.state.password,
        },
        props: this.props
      });
    } else {
      this.props.dispatch({ type: 'LOGIN_INPUT_ERROR' });
    }
  } // end login

  handleInputChangeFor = propertyName => (event) => {
    this.setState({
      [propertyName]: event.target.value,
    });
  };//end handleInputChangeFor

  render() {
    return(
      <>
        <div>
          

        <Form onSubmit={this.login} className="loginForm">
           <h2>Login</h2>
            <Form.Group>
              <Form.Label htmlFor="username">Username</Form.Label>
              <Form.Control
                type="text"
                name="username"
                className="input"
                value={this.state.username}
                onChange={this.handleInputChangeFor("username")}
              />
            </Form.Group>

            <Form.Group>
              <Form.Label htmlFor="password">Password</Form.Label>
              <Form.Control
                type="password"
                name="password"
                className="input"
                value={this.state.password}
                onChange={this.handleInputChangeFor("password")}
              />
            </Form.Group>

            {this.props.errors.loginMessage && (
              <h5 className="alert" role="alert">
                {this.props.errors.loginMessage}
              </h5>
            )}

            <Form.Group>

              <Button
                className="log-in input"
                type="submit"
                name="submit"
                value="Log In"
              >
                Log In
              </Button>

            </Form.Group>

            <div>
              <a href="/#/forgotpassword">Forgot Password? Click here.</a>
            </div>
            
          </Form>


        </div>
      </>
    );
  }
}

// Instead of taking everything from state, we just want the error messages.
// if you wanted you could write this code like this:
// const mapStateToProps = ({errors}) => ({ errors });
const mapStateToProps = state => ({
  errors: state.errors,
});

export default connect(mapStateToProps)(LoginPage);
