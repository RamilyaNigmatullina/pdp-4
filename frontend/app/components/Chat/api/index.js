import axios from 'axios';

const MESSAGE_FIELDS = ['id', 'text'];

export const createMessage = (url, text) => axios
  .post(url, { message: { text }, fields: MESSAGE_FIELDS });
