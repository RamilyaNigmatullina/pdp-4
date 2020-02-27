import React from 'react';
import Modal from 'react-bootstrap/Modal';
import PropTypes from 'prop-types';
import { fetchUsersWithoutChat } from '../api/index';
import styles from './styles.module.scss';

class ChatForm extends React.Component {
  state = {
    users: [],
  }

  componentDidUpdate() {
    if (this.props.isShown && !this.state.users.length) this.fetchUsers();
    if (!this.props.isShown && this.state.users.length) this.setState({ users: [] });
  }

  renderUserRow = (user) => (
    <div className={styles.userItem} key={user.id} onClick={(e) => this.props.onChatCreate(e, user.id)}>
      { user.full_name }
    </div>
  );

  render() {
    const { onClose, isShown } = this.props;
    return (
      <Modal
      show={isShown}
      onHide={onClose}
      size="md"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          Direct Messages
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        { this.state.users.map((user) => this.renderUserRow(user)) }
      </Modal.Body>
    </Modal>
    );
  }

  fetchUsers = () => {
    fetchUsersWithoutChat()
      .then((data) => {
        this.setState({ users: data });
      });
  }
}

ChatForm.propTypes = {
  onClose: PropTypes.func.isRequired,
  isShown: PropTypes.bool.isRequired,
  onChatCreate: PropTypes.func.isRequired,
};

export default ChatForm;
