import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class ChatItem extends React.Component {
  render() {
    const { active, chat } = this.props;
    const chatItemClasses = classNames(styles.chatItem, { [styles.active]: active });

    return (
      <div className={chatItemClasses} onClick={(e) => this.props.onClick(e, chat.id)}>
        <div className={styles.chatItemContainer}>
          <div className={styles.interlocutorAvatar}>
            <img className="rounded-circle" src={chat.interlocutor.avatar} width="32" height="32" />
          </div>
          <div className={styles.chatDetails}>
            <h5 className={styles.interlocutorFullName}>
              { chat.interlocutor.full_name }
              { chat.last_message && <span className={styles.date}>{ chat.last_message.created_at }</span> }
            </h5>
            <p className={styles.lastMessage}>
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
