// React Imports
import React, {Component} from 'react';
import {
  HashRouter as Router,
  Route,
  Redirect,
  Switch,
} from 'react-router-dom';


// Redux
import {connect} from 'react-redux';

// Global Components
import Footer from "../Footer/Footer";
import NavBootstrap from "../NavBootstrap/NavBootstrap";


// Middleware
import AdminRoute from "../AdminRoute/AdminRoute";
import ProtectedRoute from "../ProtectedRoute/ProtectedRoute";


// Pages
import AdminPage from "../AdminPage/AdminPage";
import ContactPage from '../ContactPage/ContactPage';
import HomePage from "../HomePage/HomePage";
import LoginPage from '../LoginPage/LoginPage';
import PracticeInfo from "../ProfileCreate/PracticeInfo";
import ContactInfo from "../ProfileCreate/ContactInfo";
import ProfileCreate from "../ProfileCreate/ProfileCreate";
import uploadImage from '../ProfileCreate/uploadImage/uploadImage'
import studentPractice from "../ProfileCreate/studentProfile/studentPractice";
import studentCreate from "../ProfileCreate/studentProfile/studentCreate";
import studentContact from "../ProfileCreate/studentProfile/studentContact";
import ProfileEdit from '../ProfileEdit/ProfileEdit';
import ProfileView from "../ProfileView/ProfileView";
import RegisterPage from '../RegisterPage/RegisterPage';
import ProfileEditStudent from '../ProfileEdit/ProfileEditStudent';
import ForgotPassword from "../ForgotPassword/ForgotPassword";
import NewPassword from "../NewPassword/NewPassword";


// CSS
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';

import StudentRegisterPage from '../StudentRegisterPage/StudentRegisterPage';


class App extends Component {
  componentDidMount () {
    this.props.dispatch({type: 'FETCH_USER'});
    this.props.dispatch({type: 'FETCH_LANGUAGES'});
    this.props.dispatch({type: 'FETCH_ISLANDS'});
    this.props.dispatch({type: 'FETCH_TREATMENT_APPROACHES'});
  }

  render() {
    return (
      <Router>
        <div>
          {/* Rendering NavBar component*/}
          <NavBootstrap />
          <Switch>
            {/* Visiting localhost:3000 will redirect to localhost:3000/home */}
            <Redirect exact from="/" to="/home" component={HomePage} />

            {/* Visiting localhost:3000/home will show the home page.
            This is a route anyone can see, no login necessary */}
            <Route exact path="/home" component={HomePage} />

            {/* This works the same as the other protected route, except that if the user is logged in,
            they will see the info page instead. */}

            <Route exact path="/contact" component={ContactPage} />
            {/*This is a route anyone can see, no login necessary */}
            <Route exact path="/register/:id" component={RegisterPage} />
            {/*This is a route anyone can see, no login necessary */}
            <Route
              exact
              path="/student-register/:id"
              component={StudentRegisterPage}
            />
            <Route exact path="/login" component={LoginPage} />
            <Route exact path="/forgotpassword" component={ForgotPassword} />
            <Route exact path="/passwordreset/:key" component={NewPassword} />

            {/*This is a route that is already protected by the registration key*/}
            <Route exact path="/create-profile" component={ProfileCreate} />
            <Route exact path="/student-create" component={studentCreate} />

            {/*User only sees these routes if logged in*/}
            <ProtectedRoute
              exact
              path="/edit-profile"
              component={ProfileEdit}
            />
            <ProtectedRoute
              exact
              path="/edit-student"
              component={ProfileEditStudent}
            />

            <Route exact path="/contact-info" component={ContactInfo} />
            <Route exact path="/student-contact" component={studentContact} />
            <Route exact path="/practice" component={PracticeInfo} />
            <Route exact path="/student-practice" component={studentPractice} />
            <Route exact path="/uploadimage" component={uploadImage} />

            {/* Admin View */}
            <AdminRoute
              exact
              path="/admin-edit-profile/:id"
              component={ProfileEdit}
            />
            <AdminRoute
              exact
              path="/admin-edit-profile-student/:id"
              component={ProfileEditStudent}
            />
            <Route exact path="/profile/:id" component={ProfileView} />

            <AdminRoute exact path="/admin" component={AdminPage} />

            {/* If none of the other routes matched, we will show a 404. */}
            <Route render={() => <h1>404</h1>} />
          </Switch>
          <Footer />
        </div>
      </Router>
    );}
}

export default connect()(App);
