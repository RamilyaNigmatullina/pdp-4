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
  };

  componentDidMount() {
    this.setState({
      subscription: this.subscribeToChannel(),
    });
  }

  componentDidUpdate(prevProps) {
    if (prevProps.chat.id !== this.props.chat.id) {
      this.setState({
        isLastPage: false,
        messages: [],
        subscription: this.subscribeToChannel(),
      });
    }
  }

  subscribeToChannel = () => {
    const { subscription } = this.state;

    if (subscription) subscription.unsubscribe();

    return consumer.subscriptions.create({
      channel: 'ChatChannel',
      chat_id: this.props.chat.id,
    }, {
      received: this.handleReceived,
    });
  }

  renderMessage = (message) => {
    const { currentUser, chat } = this.props;
    const isCurrentUserMessage = this.isCurrentUserMessage(message);
    const avatarUrl = isCurrentUserMessage ? currentUser.avatar : chat.interlocutor.avatar;

    return (
      <Message
        avatarUrl={avatarUrl}
        isCurrentUserMessage={isCurrentUserMessage}
        key={message.id}
        message={message}
    />);
  }

  render() {
    const { messages, isLastPage } = this.state;
    const { chat, currentUser } = this.props;

    return (
      <>
        { <Interlocutor interlocutor={chat.interlocutor} /> }

        <div className="messages">
          { <InfiniteScrolling
              isLastPage={isLastPage}
              items={messages}
              loadItems={this.handleLoadMessages}
              renderItem={this.renderMessage}
            /> }
        </div>

        { <MessageForm chatId={chat.id} currentUser={currentUser} /> }
      </>
    );
  }

  handleReceived = (message) => {
    if (this.isCurrentUserMessage(message)) this.handleMessageReceived(message);

    this.setState(({ messages }) => ({ messages: [message, ...messages] }), () => {
      const messageElement = document.getElementById(`message-${message.id}`);
      messageElement.scrollIntoView({ behavior: 'smooth' });
    });
  }

  handleMessageReceived = (message) => {
    const chat = { ...this.props.chat, last_message: message, unread_messages_count: 0 };
    const { onMessageReceived } = this.props;

    onMessageReceived(chat);
  }

  handleLoadMessages = () => {
    const createdAt = this.lastMessage() && this.lastMessage().created_at;

    fetchMessages(this.props.chat.id, createdAt)
      .then((data) => {
        this.setState(({ messages }) => ({
          isLastPage: this.isLastPage(data.length),
          messages: [...messages, ...data],
        }));
      });
  }

  isCurrentUserMessage = (message) => this.props.currentUser.id === message.sender_id

  lastMessage = () => this.state.messages[this.state.messages.length - 1]

  isLastPage(messagesCount) {
    return messagesCount < 25;
  }
}

Chat.propTypes = {
  chat: PropTypes.object.isRequired,
  currentUser: PropTypes.object.isRequired,
  onMessageReceived: PropTypes.func.isRequired,
};

export default Chat;
