import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import ChatItem from './ChatItem';
import Chat from './Chat';
import styles from './styles.module.scss';
import { readMessages } from './api/index';

class Chats extends React.Component {
  state = {
    chats: this.props.chats,
    currentChat: this.props.chats[0],
  };

  componentDidMount() {
    const { currentChat } = this.state;

    this.subscribeToChannel();

    if (currentChat.unread_messages_count > 0) { this.readChatMessages(currentChat); }
  }

  subscribeToChannel = () => {
    consumer.subscriptions.create({
      channel: 'ChatNotificationsChannel',
    }, {
      received: this.handleMessageReceived,
    });
  }

  renderChatsList() {
    return (
      <div className={styles.chatItems}>
        { this.state.chats.map((chat) => <ChatItem
            chat={chat}
            isCurrentChat={this.isCurrentChat(chat)}
            key={chat.id}
            onClick={this.handleClick} />) }
      </div>
    );
  }

  render() {
    return (
      <div className={styles.chat}>
        <div className={styles.chatsList}>
          { this.renderChatsList() }
        </div>
        <div className={styles.dialog}>
          { <Chat
              chat={this.state.currentChat}
              currentUser={this.props.currentUser}
              onMessageReceived={this.handleMessageReceived} /> }
        </div>
      </div>
    );
  }

  handleMessageReceived = (chat) => {
    this.setState(() => {
      const originalChat = this.findOriginalChat(chat.id);
      const updatedChat = this.buildChat(originalChat, chat);

      if (this.isCurrentChat(updatedChat)) this.readChatMessages(updatedChat);

      return { chats: this.moveToTop(updatedChat) };
    });
  }

  handleClick = (event, selectedChat) => {
    event.preventDefault();

    if (!this.isCurrentChat(selectedChat)) {
      if (!selectedChat.unread_messages_count) {
        this.setState({ currentChat: selectedChat });
      } else {
        this.readChatMessages(selectedChat);
      }
    }
  }

  readChatMessages = (chat) => {
    readMessages(chat.id)
      .then(() => {
        const updatedChat = this.buildChat(chat, { unread_messages_count: 0 });

        this.setState(() => ({
          chats: this.replaceChat(updatedChat),
          currentChat: updatedChat,
        }));
      });
  }

  findOriginalChat = (chatId) => this.state.chats.filter((chat) => chat.id === chatId)[0]

  buildChat = (originalChat, chat) => ({ ...originalChat, ...chat })

  isCurrentChat = (chat) => this.state.currentChat.id === chat.id

  moveToTop = (topChat) => [topChat, ...this.state.chats.filter((chat) => chat.id !== topChat.id)]

  replaceChat = (updatedChat) => this.state.chats.map((chat) => (chat.id === updatedChat.id ? updatedChat : chat))
}

Chats.propTypes = {
  chats: PropTypes.array.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default Chats;
