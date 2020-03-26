import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class Interlocutor extends React.Component {
  render() {
    const { interlocutor } = this.props;

    return (
      <div className={styles.interlocutor}>
        <div className={styles.interlocutorAvatar}>
          <img
            alt= ""
            className={classNames(styles.image, 'rounded-circle')}
            height="32"
            src={interlocutor.avatar}
            width="32"
          />
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
