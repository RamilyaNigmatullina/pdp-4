import axios from 'axios';

export const updateCompany = (companyParams) => axios
  .put('/api/v1/company', { company: companyParams })
  .then((response) => response.data)
  .catch(({ response: { data } }) => Promise.reject(data.errors));
