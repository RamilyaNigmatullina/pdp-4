import React from 'react';
import PropTypes from 'prop-types';
import consumer from 'helpers/consumer';
import ChatItem from './ChatItem';
import Chat from './Chat';
import ChatForm from './ChatForm';
import styles from './styles.module.scss';
import { readMessages, createChat } from './api/index';

class Chats extends React.Component {
  state = {
    chats: this.props.chats,
    currentChat: this.props.chats[0],
    isChatFormShown: false,
  };

  componentDidMount() {
    const { currentChat } = this.state;

    this.subscribeToChannel();

    if (currentChat && currentChat.unread_messages_count > 0) this.readChatMessages(currentChat);
  }

  subscribeToChannel = () => {
    consumer.subscriptions.create({
      channel: 'ChatNotificationsChannel',
    }, {
      received: this.handleMessageReceived,
    });
  }

  renderNewChatButton = () => (
    <button className="btn btn-outline-secondary btn-block" onClick={this.handleShowChatForm}>
      Start a new dialogue
    </button>
  )

  renderChatItem = (chat) => (
    <ChatItem
      chat={chat}
      isCurrentChat={this.isCurrentChat(chat)}
      key={chat.id}
      onClick={this.handleChatSelected} />
  );

  renderChat = () => (
    <Chat
      chat={this.state.currentChat}
      currentUser={this.props.currentUser}
      onMessageReceived={this.handleMessageReceived} />
  );

  renderChatsList = () => (
    <div className={styles.chatItems}>
      { this.renderNewChatButton() }
      { this.state.chats.map((chat) => this.renderChatItem(chat)) }
    </div>
  );

  render() {
    const { currentChat, isChatFormShown } = this.state;

    return (
      <div className={styles.chat}>
        <ChatForm
          isShown={isChatFormShown}
          onChatCreate={this.handleCreateChat}
          onClose={this.handleCloseChatForm} />

        <div className={styles.chatsList}>
          { this.renderChatsList() }
        </div>
        <div className={styles.dialog}>
          { currentChat && this.renderChat() }
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

  handleChatSelected = (event, selectedChat) => {
    event.preventDefault();

    if (!this.isCurrentChat(selectedChat)) {
      if (!selectedChat.unread_messages_count) {
        this.setState({ currentChat: selectedChat });
      } else {
        this.readChatMessages(selectedChat);
      }
    }
  }

  handleShowChatForm = () => {
    this.setState({ isChatFormShown: true });
  }

  handleCloseChatForm = () => {
    this.setState({ isChatFormShown: false });
  }

  handleCreateChat = (event, userId) => {
    createChat(userId)
      .then((data) => {
        this.setState(({ chats }) => ({
          chats: [data, ...chats],
          currentChat: data,
          isChatFormShown: false,
        }));
      });
  }

  readChatMessages = (chat) => {
    readMessages(chat.id)
      .then(() => {
        const updatedChat = this.buildChat(chat, { unread_messages_count: 0 });

        this.setState({
          chats: this.replaceChat(updatedChat),
          currentChat: updatedChat,
        });
      });
  }

  findOriginalChat = (chatId) => this.state.chats.filter((chat) => chat.id === chatId)[0]

  buildChat = (originalChat, chat) => ({ ...originalChat, ...chat })

  isCurrentChat = (chat) => {
    const { currentChat } = this.state;

    return !!currentChat && currentChat.id === chat.id;
  }

  moveToTop = (topChat) => [topChat, ...this.state.chats.filter((chat) => chat.id !== topChat.id)]

  replaceChat = (updatedChat) => this.state.chats.map((chat) => (chat.id === updatedChat.id ? updatedChat : chat))
}

Chats.propTypes = {
  chats: PropTypes.array.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default Chats;
