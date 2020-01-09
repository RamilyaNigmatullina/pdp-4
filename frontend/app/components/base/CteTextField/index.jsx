import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

class CteTextField extends React.Component {
  render() {
    const { name, label, error, disabled } = this.props;
    const divClasses = classNames('form-group', { 'form-group-invalid': error });
    const inputClasses = classNames('form-control string', { 'is-invalid': error });

    return (
      <div className={divClasses}>
        <label htmlFor={`text-field-${name}`}>{ label }</label>
        <input
          className={inputClasses}
          type='text'
          id={`text-field-${this.props.name}`}
          defaultValue={this.props.value}
          onBlur={this.handleBlur}
          disabled={disabled}
        />
        { error && <div className='invalid-feedback'>{ error }</div> }
      </div>
    );
  }

  handleBlur = (event) => {
    const newValue = event.target.value.trim();
    const { error, name, onSubmit, value } = this.props;

    if (error || newValue !== value) onSubmit({ [name]: newValue });
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
