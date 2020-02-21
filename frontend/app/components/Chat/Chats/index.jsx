import React from 'react';
import PropTypes from 'prop-types';

class Chats extends React.Component {
  renderChat = (chat) => (
    <div key={chat.id}>
      <a href="#" className="chat-link" onClick={(e) => this.props.onClick(e, chat.id)}>
        { chat.interlocutor.full_name }
      </a>
    </div>
  )

  render() {
    return (
      <div className="chats-list">
        { this.props.chats.map((chat) => this.renderChat(chat)) }
      </div>
    );
  }
}

Chats.propTypes = {
  chats: PropTypes.array.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Chats;
