import React from 'react';
import PropTypes from 'prop-types';

class Users extends React.Component {
  renderUser(user) {
    return (
      <div data-id={user.id}>
        { user.full_name }
      </div>
    );
  }

  render() {
    return (
      <div className="users-list">
        { this.props.users.map((user) => this.renderUser(user)) }
      </div>
    );
  }
}

Users.propTypes = {
  users: PropTypes.array.isRequired,
};

export default Users;
