import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import InfiniteScrolling from 'components/InfiniteScrolling';
import Message from './Message';
import MessageForm from './MessageForm';
import Chats from './Chats';
import { fetchMessages } from './api/index';

class Chat extends React.Component {
  state = {
    chat: this.props.chat,
    chats: this.props.chats,
    isLastPage: false,
    messages: [],
    page: 1,
    subscriptionCreated: false,
  };

  componentDidMount() {
    this.loadMessages();

    consumer.subscriptions.create({
      channel: 'ChatChannel',
      chat_id: this.state.chat.id,
    }, {
      received: this.handleReceived,
    });
  }

  componentDidUpdate() {
    const { isLastPage } = this.state;

    if (!isLastPage) { this.loadMessages(); }
  }

  renderMessage = (message) => {
    const { currentUser } = this.props;
    const isCurrentUserMessage = currentUser.id === message.sender_id;
    const avatarUrl = isCurrentUserMessage ? currentUser.avatar : this.state.chat.interlocutor.avatar;

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
        <div>
          { <Chats chats={this.props.chats} onClick={this.handleSubmit} /> }
        </div>
        <div className="dialog">
          { this.state.chat.interlocutor.full_name }

          <div className="messages">
            { <InfiniteScrolling
                isLastPage={this.state.isLastPage}
                items={this.state.messages}
                loadItems={this.loadMessages}
                renderItem={this.renderMessage}
              /> }
          </div>

          { <MessageForm chatId={this.state.chat.id} /> }
        </div>
      </div>
    );
  }

  handleSubmit = (event, chatId) => {
    event.preventDefault();

    const selectedChat = this.state.chats.filter((chat) => chat.id === chatId)[0];

    this.setState({
      chat: selectedChat,
      isLastPage: false,
      messages: [],
      page: 1,
      subscriptionCreated: false,
    });
  }

  handleReceived = (message) => {
    this.setState(({ messages }) => ({ messages: [message, ...messages], subscriptionCreated: true }), () => {
      const messageElement = document.getElementById(`message-${message.id}`);
      messageElement.scrollIntoView({ behavior: 'smooth' });
    });
  }

  loadMessages = () => {
    console.log("chat.id: ");
    console.log(this.state.chat.id);
    console.log("page: ");
    console.log(this.state.page);
    fetchMessages(this.state.chat.id, this.state.page)
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
  chat: PropTypes.object.isRequired,
  chats: PropTypes.array.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default Chat;
