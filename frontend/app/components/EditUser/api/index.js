import axios from 'axios';

export const updateUser = (userParams) => axios
  .put('/api/v1/profile', { user: userParams })
  .then((response) => response.data)
  .catch(({ response: { data } }) => Promise.reject(data.errors));

export const updateUserAvatar = (formData) => axios
  .put('/api/v1/profile', formData)
  .then((response) => response.data)
  .catch(({ response: { data } }) => Promise.reject(data.errors));
