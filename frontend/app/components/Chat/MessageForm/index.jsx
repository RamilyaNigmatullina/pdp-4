import React from 'react';
import PropTypes from 'prop-types';
import { createMessage } from '../api/index';

class MessageForm extends React.Component {
  constructor(props) {
    super(props);

    this.textInput = React.createRef();
  }

  renderTextarea() {
    return (
      <div className="form-group text message-form__text">
        <textarea
          ref={this.textInput}
          className="form-control"
          rows="1"
          placeholder="Type text..."
          name="message[text]"
        />
      </div>
    );
  }

  render() {
    return (
      <form
        className="simple_form message-form"
        method="post"
        action={`/api/v1/chats/${this.props.chatId}/messages`}
        onSubmit={this.handleSubmit}
      >

        { this.renderTextarea() }
        <button className="btn btn-primary message-form__buttom">Send</button>
      </form>
    );
  }

  handleSubmit = (event) => {
    event.preventDefault();

    const formData = new FormData(event.target);
    const url = event.target.action;

    createMessage(url, formData)
      .then((response) => {
        this.textInput.current.value = '';

        return response.data;
      });
  }
}

MessageForm.propTypes = {
  chatId: PropTypes.number,
};

export default MessageForm;
