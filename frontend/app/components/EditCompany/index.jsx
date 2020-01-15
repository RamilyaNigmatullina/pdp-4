import React from 'react';
import PropTypes from 'prop-types';
import CteTextField from 'components/base/CteTextField';
import { updateCompany } from './api/index';

class EditCompany extends React.Component {
  state = {
    company: this.props.company,
    errors: {},
  }

  render() {
    const { company, errors } = this.state;

    return (
      <div className='container'>
        <div className='row justify-content-center'>
          <div className='col col-md-6'>
            <h2>Settings</h2>
            <br/>

            <CteTextField
              error={errors.name}
              disabled={false}
              label="Name"
              name="name"
              onSubmit={this.handleSubmit}
              value={company.name}
            />
            <CteTextField
              error={errors.slug}
              disabled={true}
              label= "Slug"
              name="slug"
              onSubmit={this.handleSubmit}
              value={company.slug}
            />
          </div>
        </div>
      </div>
    );
  }

  handleSubmit = (companyParams) => {
    const name = Object.keys(companyParams)[0];

    return updateCompany(companyParams)
      .then((data) => {
        this.setState(
          {
            company: data,
            errors: { ...this.state.errors, ...{ [name]: null } },
          },
        );
      })
      .catch((errors) => {
        this.setState({ errors: { ...this.state.errors, ...{ [name]: errors[name] } } });
      });
  }
}

EditCompany.propTypes = {
  company: PropTypes.object.isRequired,
};

export default EditCompany;
