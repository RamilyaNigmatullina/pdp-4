import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import InfiniteScrolling from 'components/InfiniteScrolling';
import Message from './Message';
import MessageForm from './MessageForm';
import Interlocutor from './Interlocutor';
import { fetchMessages } from '../api/index';

class Chat extends React.Component {
  state = {
    isLastPage: false,
    messages: [],
    page: 1,
  };

  componentDidMount() {
    this.subscribeToChannel();
    this.handleLoadMessages();
  }

  componentDidUpdate(prevProps) {
    if (prevProps.chat.id !== this.props.chat.id) {
      this.subscribeToChannel();
      this.loadMessages();
    }
  }

  subscribeToChannel = () => {
    const prevSubscription = consumer.subscriptions.subscriptions[0];

    if (prevSubscription) { prevSubscription.unsubscribe(); }

    consumer.subscriptions.create({
      channel: 'ChatChannel',
      chat_id: this.props.chat.id,
    }, {
      received: this.handleReceived,
    });
  }

  renderMessage = (message) => {
    const { currentUser } = this.props;
    const isCurrentUserMessage = currentUser.id === message.sender_id;
    const avatarUrl = isCurrentUserMessage ? currentUser.avatar : this.props.chat.interlocutor.avatar;

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
      <>
        { < Interlocutor interlocutor={this.props.chat.interlocutor} /> }

        <div className="messages">
          { <InfiniteScrolling
              isLastPage={this.state.isLastPage}
              items={this.state.messages}
              loadItems={this.handleLoadMessages}
              renderItem={this.renderMessage}
            /> }
        </div>

        { <MessageForm chatId={this.props.chat.id} /> }
      </>
    );
  }

  handleReceived = (message) => {
    this.setState(({ messages }) => ({ messages: [message, ...messages], subscriptionCreated: true }), () => {
      const messageElement = document.getElementById(`message-${message.id}`);
      messageElement.scrollIntoView({ behavior: 'smooth' });
    });
  }

  handleLoadMessages = () => {
    fetchMessages(this.props.chat.id, this.state.page)
      .then((data) => {
        this.setState(({ messages, page }) => ({
          isLastPage: !data.length,
          messages: [...messages, ...data],
          page: page + 1,
        }));
      });
  }

  loadMessages = () => {
    fetchMessages(this.props.chat.id, 1)
      .then((data) => {
        this.setState(() => ({
          isLastPage: !data.length,
          messages: data,
          page: 2,
        }));
      });
  }
}

Chat.propTypes = {
  chat: PropTypes.object.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default Chat;
