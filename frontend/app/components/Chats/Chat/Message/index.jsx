import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class Message extends React.Component {
  render() {
    const { avatarUrl, message, isCurrentUserMessage } = this.props;
    const messageClasses = classNames(styles.message, {
      [styles.currentUserMessage]: isCurrentUserMessage,
      [styles.interlocutorMessage]: !isCurrentUserMessage,
    });

    return (
      <div className={messageClasses} id={`message-${message.id}`}>
        { !isCurrentUserMessage && <img className="rounded-circle" src={avatarUrl} width="32" height="32" /> }
        <span className={styles.messageText}>{ message.text }</span>
        { isCurrentUserMessage && <img className="rounded-circle" src={avatarUrl} width="32" height="32" /> }
      </div>
    );
  }
}

Message.propTypes = {
  avatarUrl: PropTypes.string.isRequired,
  isCurrentUserMessage: PropTypes.bool.isRequired,
  message: PropTypes.object.isRequired,
};

export default Message;
