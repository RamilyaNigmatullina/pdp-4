import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import InfiniteScrolling from 'components/InfiniteScrolling';
import Message from './Message';
import MessageForm from './MessageForm';
import { fetchMessages } from './api/index';

class Chat extends React.Component {
  state = {
    isLastPage: false,
    messages: this.props.messages,
    page: 2,
  };

  componentDidMount() {
    consumer.subscriptions.create({
      channel: 'ChatChannel',
      chat_id: this.props.chat.id,
    }, {
      received: this.handleReceived,
    });
  }

  renderMessage = (message) => {
    const { interlocutor, currentUser } = this.props;
    const isCurrentUserMessage = currentUser.id === message.sender_id;
    const avatarUrl = isCurrentUserMessage ? currentUser.avatar : interlocutor.avatar;

    return (
      <Message
        avatarUrl={avatarUrl}
        isCurrentUserMessage={isCurrentUserMessage}
        key={message.id}
        message={message}
    />);
  }

  render() {
    return (
      <div className="chat">
        { this.props.interlocutor.full_name }

        <div className="messages">
          { <InfiniteScrolling
              isLastPage={this.state.isLastPage}
              items={this.state.messages}
              loadItems={this.handleLoadMessages}
              renderItem={this.renderMessage}
            /> }
        </div>

        { <MessageForm chatId={this.props.chat.id} /> }
      </div>
    );
  }

  handleReceived = (message) => {
    this.setState(({ messages }) => ({ messages: [message, ...messages] }), () => {
      const messageElement = document.getElementById(`message-${message.id}`);
      messageElement.scrollIntoView({ behavior: 'smooth' });
    });
  }

  handleLoadMessages = () => {
    fetchMessages(this.props.chat.id, this.state.page)
      .then((data) => {
        this.setState(({ messages, page }) => ({
          messages: [...messages, ...data],
          page: page + 1,
          isLastPage: !data.length,
        }));
      });
  }
}

Chat.propTypes = {
  interlocutor: PropTypes.object,
  currentUser: PropTypes.object,
  messages: PropTypes.array,
  chat: PropTypes.object,
};

export default Chat;
