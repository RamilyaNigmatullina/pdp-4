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

  renderChatsList() {
    return (
      <div className="chats-list inbox_chat">
        {
          this.props.chats.map((chat) => {
            const active = this.state.chat.id === chat.id;

            return <ChatItem active={active} chat={chat} key={chat.id} onClick={this.handleClick} />;
          })
        }
      </div>
    );
  }

  render() {
    return (
      <div className={classNames(styles.chat)}>
        <div className={classNames(styles.chatsList)}>
          { this.renderChatsList() }
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
