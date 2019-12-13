import axios from 'axios';

const MESSAGE_FIELDS = ['id', 'text', 'sender_id'];

export const createMessage = (chatId, message) => axios
  .post(`/api/v1/chats/${chatId}/messages`, { ...message })
  .then((response) => response.data);

export const fetchMessages = (chatId, page) => axios
  .get(`/api/v1/chats/${chatId}/messages`, { params: { page, fields: MESSAGE_FIELDS } })
  .then((response) => response.data);
