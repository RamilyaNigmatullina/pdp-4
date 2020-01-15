import React from 'react';
import PropTypes from 'prop-types';
import CteTextField from 'components/base/CteTextField';
import { updateUser } from './api/index';

class EditUser extends React.Component {
  state = {
    user: this.props.user,
    errors: {},
  }

  render() {
    const { user, errors } = this.state;

    return (
      <div className='container'>
        <div className='row justify-content-center'>
          <div className='col col-md-6'>
            <h2>Edit Profile</h2>
            <br/>

            <CteTextField
              error={errors.full_name}
              disabled={false}
              label="Full name"
              name="full_name"
              onSubmit={this.handleSubmit}
              value={user.full_name}
            />
            <CteTextField
              error={errors.email}
              disabled={true}
              label= "Email"
              name="email"
              onSubmit={this.handleSubmit}
              value={user.email}
            />
            <CteTextField
              error={errors.password}
              disabled={false}
              label= "Password"
              name="password"
              onSubmit={this.handleSubmit}
              value={user.password}
            />
            <CteTextField
              error={errors.password_confirmation}
              disabled={false}
              label= "Password confirmation"
              name="password_confirmation"
              onSubmit={this.handleSubmit}
              value={user.password_confirmation}
            />
          </div>
        </div>
      </div>
    );
  }

  handleSubmit = (userParams) => {
    const name = Object.keys(userParams)[0];

    return updateUser(userParams)
      .then((data) => {
        this.setState(
          {
            user: data,
            errors: { ...this.state.errors, ...{ [name]: null } },
          },
        );
      })
      .catch((errors) => {
        this.setState({ errors: { ...this.state.errors, ...{ [name]: errors[name] } } });
      });
  }
}

EditUser.propTypes = {
  user: PropTypes.object.isRequired,
};

export default EditUser;
