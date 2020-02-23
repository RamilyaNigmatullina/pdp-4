import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import ChatItem from './ChatItem';
import Chat from './Chat';
import styles from './styles.module.scss';

class Chats extends React.Component {
  state = {
    chat: this.props.chats[0],
    chats: this.props.chats,
  };

  render() {
    return (
      <div className={classNames(styles.chat)}>
        <div className={classNames(styles.chatsList)}>
          { <ChatItem chats={this.props.chats} onClick={this.handleClick} selectedChat={this.state.chat} /> }
        </div>
        <div className={classNames(styles.dialog)}>
          { <Chat chat={this.state.chat} currentUser={this.props.currentUser} /> }
        </div>
      </div>
    );
  }

  handleClick = (event, chatId) => {
    event.preventDefault();

    const selectedChat = this.state.chats.filter((chat) => chat.id === chatId)[0];

    if (this.state.chat !== selectedChat) { this.setState({ chat: selectedChat }); }
  }
}

Chats.propTypes = {
  chats: PropTypes.array.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default Chats;
