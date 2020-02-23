import React from 'react';
import PropTypes from 'prop-types';
import styles from './styles.module.scss';

class Interlocutor extends React.Component {
  render() {
    const { interlocutor } = this.props;

    return (
      <div className={styles.interlocutor}>
        <div className={styles.interlocutorAvatar}>
          <img className="rounded-circle" src={interlocutor.avatar} alt= "" width="32" height="32" />
        </div>
        <div className={styles.interlocutorFullName}>
          { interlocutor.full_name }
        </div>
      </div>
    );
  }
}

Interlocutor.propTypes = {
  interlocutor: PropTypes.object.isRequired,
};

export default Interlocutor;
