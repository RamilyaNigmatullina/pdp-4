import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

class ChatItem extends React.Component {
  renderChat = (chat) => {
    const activeChat = this.props.selectedChat.id === chat.id;
    const chatItemClasses = classNames('chat_list', { active_chat: activeChat });

    return (
      <div key={chat.id} className={chatItemClasses} onClick={(e) => this.props.onClick(e, chat.id)}>
        <div className="chat_people">
          <div className="chat_img">
            <img className="rounded-circle" src={chat.interlocutor.avatar} width="32" height="32" />
          </div>
          <div className="chat_ib">
            <h5>
              { chat.interlocutor.full_name }
              { chat.last_message && <span className="chat_date">{ chat.last_message.created_at }</span> }
            </h5>
            <p class="last-message">
              { chat.last_message && chat.last_message.text }
            </p>
          </div>
        </div>
      </div>
    );
  }

  render() {
    return (
      <div className="chats-list inbox_chat">
        { this.props.chats.map((chat) => this.renderChat(chat)) }
      </div>
    );
  }
}

ChatItem.propTypes = {
  chats: PropTypes.array.isRequired,
  selectedChat: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default ChatItem;
