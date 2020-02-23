import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import $ from 'jquery';
import 'form-serializer';
import { createMessage } from '../../api/index';
import styles from './styles.module.scss';

class MessageForm extends React.Component {
  constructor(props) {
    super(props);
    this.textInput = React.createRef();
  }

  renderTextarea() {
    return (
      <div className={classNames(styles.formText, 'form-group', 'text')}>
        <textarea
          ref={this.textInput}
          className="form-control"
          rows="1"
          placeholder="Type text..."
          name="message[text]"
          onKeyUp={this.handleKeyUp}
        />
      </div>
    );
  }

  render() {
    return (
      <form
        className={classNames(styles.messageForm, 'simple_form')}
        method="post"
        action={`/api/v1/chats/${this.props.chatId}/messages`}
        onSubmit={this.handleSubmit}
      >

        { this.renderTextarea() }
        <button className={classNames(styles.formButton, 'btn', 'btn-primary')}>Send</button>
      </form>
    );
  }

  handleSubmit = (event) => {
    event.preventDefault();

    if (!this.textInput.current.value) { return; }

    const formData = $(event.target).serializeObject();
    createMessage(this.props.chatId, formData)
      .then(() => {
        this.textInput.current.value = '';
      });
  }

  handleKeyUp = (event) => {
    if (event.keyCode === 13) { this.handleSubmit(event); }
  }
}

MessageForm.propTypes = {
  chatId: PropTypes.number.isRequired,
};

export default MessageForm;
