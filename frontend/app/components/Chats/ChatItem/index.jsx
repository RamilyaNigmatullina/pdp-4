import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

class ChatItem extends React.Component {
  render() {
    const { active, chat } = this.props;
    const chatItemClasses = classNames('chat_list', { active_chat: active });

    return (
      <div className={chatItemClasses} onClick={(e) => this.props.onClick(e, chat.id)}>
        <div className="chat_people">
          <div className="chat_img">
            <img className="rounded-circle" src={chat.interlocutor.avatar} width="32" height="32" />
          </div>
          <div className="chat_ib">
            <h5>
              { chat.interlocutor.full_name }
              { chat.last_message && <span className="chat_date">{ chat.last_message.created_at }</span> }
            </h5>
            <p className="last-message">
              { chat.last_message && chat.last_message.text }
            </p>
          </div>
        </div>
      </div>
    );
  }
}

ChatItem.propTypes = {
  active: PropTypes.bool.isRequired,
  chat: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default ChatItem;
