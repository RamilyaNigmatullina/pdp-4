import axios from 'axios';

const MESSAGE_FIELDS = ['id', 'text'];

export const createMessage = (url, formData) => {
  formData.append('fields', MESSAGE_FIELDS);

  axios.post(url, formData);
};
