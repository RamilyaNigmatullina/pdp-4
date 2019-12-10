import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

class Message extends React.Component {
  render() {
    const { avatarUrl, message, isCurrentUserMessage } = this.props;
    const messageClasses = classNames('message', {
      'message--current-user': isCurrentUserMessage,
      'message--interlocutor': !isCurrentUserMessage,
    });

    return (
      <div className={messageClasses} id={`message-${message.id}`}>
        { !isCurrentUserMessage && <img className="rounded-circle" src={avatarUrl} width="32" height="32" /> }
        <span className="message__text">{ message.text }</span>
        { isCurrentUserMessage && <img className="rounded-circle" src={avatarUrl} width="32" height="32" /> }
      </div>
    );
  }
}

Message.propTypes = {
  avatarUrl: PropTypes.string,
  isCurrentUserMessage: PropTypes.bool,
  message: PropTypes.object,
};

export default Message;
