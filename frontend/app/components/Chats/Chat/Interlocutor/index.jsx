import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import styles from './styles.module.scss';

class Interlocutor extends React.Component {
  render() {
    const { interlocutor } = this.props;

    return (
      <div className={classNames(styles.interlocutor)}>
        <div className={classNames(styles.interlocutorAvatar)}>
          <img className="rounded-circle" src={interlocutor.avatar} alt= "" width="32" height="32" />
        </div>
        <div className={classNames(styles.interlocutorFullName)}>
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
