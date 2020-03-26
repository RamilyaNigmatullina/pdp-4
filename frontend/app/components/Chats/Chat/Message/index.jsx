import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class Message extends React.Component {
  avatar(avatarUrl) {
    return <img className={classNames(styles.image, 'rounded-circle')} src={avatarUrl} width="32" height="32" />;
  }

  render() {
    const { avatarUrl, message, isCurrentUserMessage } = this.props;
    const messageClasses = classNames(styles.message, {
      [styles.currentUserMessage]: isCurrentUserMessage,
      [styles.interlocutorMessage]: !isCurrentUserMessage,
    });

    return (
      <div className={messageClasses} id={`message-${message.id}`}>
        { !isCurrentUserMessage && this.avatar(avatarUrl) }
        <span className={styles.messageText}>{ message.text }</span>
        { isCurrentUserMessage && this.avatar(avatarUrl) }
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
