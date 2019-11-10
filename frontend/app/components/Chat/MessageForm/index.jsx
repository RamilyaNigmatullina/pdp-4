import React from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

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
      <form className="simple_form message-form" method="post" onSubmit={this.hadleSubmit.bind(this)}>
        { this.renderTextarea() }
        <button className="btn btn-primary message-form__buttom">Send</button>
      </form>
    );
  }

  hadleSubmit = (event) => {
    event.preventDefault();

    const formData = new FormData(event.target);

    axios.post(
      `/api/v1/chats/${this.props.chatId}/messages`,
      formData,
    ).then(() => {
      this.textInput.current.value = '';
    });
  }
}

MessageForm.propTypes = {
  chatId: PropTypes.number,
};

export default MessageForm;
