import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

class CteTextField extends React.Component {
  state = {
    isEditing: false,
  };

  isValid = () => {
    const { error } = this.props;
    const { isEditing } = this.state;

    return !error && !isEditing;
  }

  render() {
    const { name, label, error, disabled } = this.props;
    const divClasses = classNames('form-group', { 'form-group-invalid': error });
    const inputClasses = classNames(
      'form-control string', {
        'is-valid': this.isValid(),
        'is-invalid': error,
      },
    );

    return (
      <div className={divClasses}>
        <label htmlFor={`text-field-${name}`}>{ label }</label>
        <input
          className={inputClasses}
          defaultValue={this.props.value}
          disabled={disabled}
          id={`text-field-${this.props.name}`}
          onBlur={this.handleBlur}
          onChange={this.handleChange}
          type='text'
        />
        { error && <div className='invalid-feedback'>{ error }</div> }
      </div>
    );
  }

  handleBlur = (event) => {
    const newValue = event.target.value.trim();
    const { error, name, onSubmit, value } = this.props;

    if (error || newValue !== value) {
      onSubmit({ [name]: newValue }).then(() => {
        this.setState({ isEditing: false });
      });
    }
  }

  handleChange = (event) => {
    const isEditing = this.props.value !== event.target.value;

    this.setState({ isEditing });
  }
}

CteTextField.propTypes = {
  error: PropTypes.array,
  disabled: PropTypes.bool.isRequired,
  label: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
  onSubmit: PropTypes.func.isRequired,
  value: PropTypes.string,
};

export default CteTextField;
