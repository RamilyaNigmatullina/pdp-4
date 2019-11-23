import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import Message from './Message';
import MessageForm from './MessageForm';

class Chat extends React.Component {
  state = {
    messages: this.props.messages,
  };

  componentDidMount() {
    consumer.subscriptions.create({
      channel: 'ChatChannel',
      chat_id: this.props.chat.id,
    }, {
      received: this.handleReceived,
    });
  }

  renderMessages() {
    const { interlocutor, currentUser } = this.props;

    return this.state.messages.map((message) => {
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

  handleReceived = (message) => {
    this.setState(({ messages }) => ({ messages: [message, ...messages] }));
  }
}

Chat.propTypes = {
  interlocutor: PropTypes.object,
  currentUser: PropTypes.object,
  messages: PropTypes.array,
  chat: PropTypes.object,
};

export default Chat;
