import React from 'react';
import PropTypes from 'prop-types';
import Message from './Message';
import MessageForm from './MessageForm';

class Chat extends React.Component {
  renderMessages() {
    const { interlocutor, currentUser, messages } = this.props;

    return messages.map((message) => {
      const isCurrentUserMessage = currentUser.id === message.sender_id;
      const avatarUrl = isCurrentUserMessage ? currentUser.avatar : interlocutor.avatar;

      return <Message
        avatarUrl={avatarUrl}
        isCurrentUserMessage={isCurrentUserMessage}
        key={message.id}
        message={message}
      />;
    });
  }

  render() {
    return (
      <div className="chat">
        {this.props.interlocutor.full_name}

        <div className="messages">
          {this.renderMessages()}
        </div>

        { <MessageForm chatId={this.props.chat.id} /> }
      </div>
    );
  }
}

Chat.propTypes = {
  interlocutor: PropTypes.object,
  currentUser: PropTypes.object,
  messages: PropTypes.array,
  chat: PropTypes.object,
};

export default Chat;
