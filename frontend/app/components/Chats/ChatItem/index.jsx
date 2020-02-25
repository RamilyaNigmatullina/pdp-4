import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class ChatItem extends React.Component {
  render() {
    const { isCurrentChat, chat } = this.props;
    const chatItemClasses = classNames(styles.chatItem, { [styles.active]: isCurrentChat });

    return (
      <div className={chatItemClasses} onClick={(e) => this.props.onClick(e, chat)}>
        <div className={styles.chatItemContainer}>
          <div className={styles.interlocutorAvatar}>
            <img className="rounded-circle" src={chat.interlocutor.avatar} width="32" height="32" />
          </div>
          <div className={styles.details}>
            <div className={styles.interlocutorFullName}>
              { chat.interlocutor.full_name }
            </div>
            { chat.last_message && <div className={styles.date}>
              { chat.last_message.created_at }
            </div> }
          </div>
          <div className={styles.details}>
            <div className={styles.lastMessage}>
              { chat.last_message && chat.last_message.text }
            </div>
            { !!chat.unread_messages_count
                && <div className={classNames(styles.badge, 'badge badge-pill badge-secondary')}>
                  { chat.unread_messages_count }
                </div> }
          </div>
        </div>
      </div>
    );
  }
}

ChatItem.propTypes = {
  isCurrentChat: PropTypes.bool.isRequired,
  chat: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default ChatItem;
