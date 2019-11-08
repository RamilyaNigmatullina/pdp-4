import React from 'react';
import PropTypes from 'prop-types';
import { getCsrf } from 'helpers/selectors';

class MessageForm extends React.Component {
  renderTextarea() {
    return (
      <div className="form-group text message-form__text">
        <textarea
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
      <form className="simple_form message-form" action={`/chats/${this.props.chatId}/messages`} method="post">
        { this.renderTextarea() }
        <input type="hidden" name="authenticity_token" value={getCsrf()}/>
        <button className="btn btn-primary message-form__buttom">Send</button>
      </form>
    );
  }
}

MessageForm.propTypes = {
  chatId: PropTypes.number,
};

export default MessageForm;
