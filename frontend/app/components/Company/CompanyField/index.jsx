import React from 'react';
import PropTypes from 'prop-types';

class CompanyField extends React.Component {
  state = {
    isEditing: false,
  }

  renderInput() {
    const { name, value } = this.props;

    return (
      <input
        className="form-control string required"
        required="required"
        aria-required="true"
        type='text'
        value={value}
        name='company[name]'
        id='company_name'
      />
    );
  }

  render() {
    const { name, value } = this.props;
    const { isEditing } = this.state;

    return (
      <tr>
        <td scope='row'>{ name }</td>
        <td onClick={this.handleClick}>{ isEditing ? this.renderInput() : value }</td>
      </tr>
    );
  }

  handleClick = () => {
    this.setState(({ isEditing }) => ({ isEditing: !isEditing }));
  }
}

CompanyField.propTypes = {
  name: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
  editable: PropTypes.bool.isRequired,
};

export default CompanyField;
