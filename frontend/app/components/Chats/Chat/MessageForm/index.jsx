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

    this.state = { isSending: false, value: this.getValue() };
  }

  componentDidUpdate(prevProps) {
    if (prevProps.chatId !== this.props.chatId) {
      this.setState({ value: this.getValue() });
    }
  }

  renderTextarea() {
    return (
      <div className={classNames(styles.formText, 'form-group', 'text')}>
        <textarea
          className="form-control"
          name="message[text]"
          onChange={(event) => { this.handleChange(event); }}
          onKeyUp={this.handleKeyUp}
          placeholder="Type text..."
          ref={this.textInput}
          rows="1"
          value={this.state.value}
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
        <button
          className={classNames(styles.formButton, 'btn', 'btn-primary')}
          disabled={this.state.isSending}>
          Send
        </button>
      </form>
    );
  }

  handleSubmit = (event) => {
    event.preventDefault();

    if (!this.textInput.current.value.trim() || this.state.isSending) return;

    this.setState({ isSending: true, value: this.textInput.current.value.trim() });

    const formData = $(event.target).serializeObject();
    createMessage(this.props.chatId, formData)
      .then(() => {
        localStorage.setItem(this.chatUid(), '');
        this.setState({ isSending: false, value: '' });
      });
  }

  handleKeyUp = (event) => {
    if (event.keyCode === 13) {
      this.setState({ value: this.textInput.current.value.trim() });

      this.handleSubmit(event);
    }
  }

  handleChange = (event) => {
    const { value } = event.target;

    localStorage.setItem(this.chatUid(), value);
    this.setState({ value });
  }

  chatUid = () => {
    const { chatId, currentUser } = this.props;

    return `chat_${chatId}_${currentUser.id}`;
  }

  getValue = () => localStorage.getItem(this.chatUid()) || ''
}

MessageForm.propTypes = {
  chatId: PropTypes.number.isRequired,
  currentUser: PropTypes.object.isRequired,
};

export default MessageForm;
