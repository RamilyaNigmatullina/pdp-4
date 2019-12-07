import React from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import 'form-serializer';
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
          className="form-control message-form__textarea"
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
        <button className="btn btn-primary message-form__button">Send</button>
      </form>
    );
  }

  handleSubmit = (event) => {
    event.preventDefault();

    const formData = $(event.target).serializeObject();
    console.log(123);
    createMessage(this.props.chatId, formData)
      .then(() => {
        this.textInput.current.value = 'hello';
      });
  }
}

MessageForm.propTypes = {
  chatId: PropTypes.number,
};

export default MessageForm;
