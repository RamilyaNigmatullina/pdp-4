import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import moment from 'moment';
import styles from './styles.module.scss';

class ChatItem extends React.Component {
  renderAvatar = () => (
    <div className={styles.interlocutorAvatar}>
      <img
        className={classNames(styles.image, 'rounded-circle')}
        height="32"
        src={this.props.chat.interlocutor.avatar}
        width="32"
      />
    </div>
  );

  renderDate = () => (
    <div className={styles.date}>
      { moment(this.props.chat.last_message.created_at).calendar() }
    </div>
  );

  renderFullNameAndDate = () => {
    const { chat } = this.props;

    return (
      <div className={styles.details}>
        <div className={styles.interlocutorFullName}>
          { chat.interlocutor.full_name }
        </div>
        { chat.last_message && this.renderDate() }
      </div>
    );
  }

  renderUnreadMessagesBadge = () => (
    <div className={classNames(styles.badge, 'badge badge-pill badge-secondary')}>
      { this.props.chat.unread_messages_count }
    </div>
  );

  renderLastMessageAndUnreadMessagesBadge = () => {
    const { chat } = this.props;

    return (
      <div className={styles.details}>
        <div className={styles.lastMessage}>
          { chat.last_message && chat.last_message.text }
        </div>
        { !!chat.unread_messages_count && this.renderUnreadMessagesBadge() }
      </div>
    );
  }

  render() {
    const { chat, onClick, isCurrentChat } = this.props;
    const chatItemClasses = classNames(styles.chatItem, { [styles.active]: isCurrentChat });

    return (
      <div className={chatItemClasses} onClick={(e) => onClick(e, chat)}>
        <div className={styles.chatItemContainer}>
          { this.renderAvatar() }
          { this.renderFullNameAndDate() }
          { this.renderLastMessageAndUnreadMessagesBadge() }
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
