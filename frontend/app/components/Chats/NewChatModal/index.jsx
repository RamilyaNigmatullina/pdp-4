import React from 'react';
import Modal from 'react-bootstrap/Modal';
import PropTypes from 'prop-types';
import { fetchUsersWithoutChat } from '../api/index';
import styles from './styles.module.scss';

class NewChatModal extends React.Component {
  state = {
    users: null,
  }

  componentDidUpdate() {
    if (this.props.isShown && !this.state.users) this.fetchUsers();
    if (!this.props.isShown && this.state.users) this.setState({ users: null });
  }

  renderUserRow = (user) => (
    <div className={styles.userItem} key={user.id} onClick={(e) => this.props.onChatCreate(e, user.id)}>
      { user.full_name }
    </div>
  );

  render() {
    const { onClose, isShown } = this.props;
    const { users } = this.state;

    if (!isShown) return null;

    return (
      <Modal aria-labelledby="contained-modal-title-vcenter" onHide={onClose} show={isShown} size="md" centered >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            Direct Messages
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          { users && !!users.length && this.state.users.map((user) => this.renderUserRow(user)) }
          { users && !users.length && <div>No available users</div> }
        </Modal.Body>
      </Modal>
    );
  }

  fetchUsers = () => {
    fetchUsersWithoutChat().then((data) => this.setState({ users: data }));
  }
}

NewChatModal.propTypes = {
  onClose: PropTypes.func.isRequired,
  isShown: PropTypes.bool.isRequired,
  onChatCreate: PropTypes.func.isRequired,
};

export default NewChatModal;
