import React from 'react';
import PropTypes from 'prop-types';
import CompanyField from './CompanyField';

class Company extends React.Component {
  render() {
    const { company } = this.props;

    return (
      <div>
        <h2>Settings</h2>
        <br/>

        <table className='table'>
          <tbody>
            { <CompanyField name="Name" value={company.name} editable={true} /> }
            { <CompanyField name="Slug" value={company.slug} editable={false} /> }
          </tbody>
        </table>
      </div>
    );
  }
}

Company.propTypes = {
  company: PropTypes.object.isRequired,
};

export default Company;
