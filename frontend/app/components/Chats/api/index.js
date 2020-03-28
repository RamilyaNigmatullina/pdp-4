import axios from 'axios';

const MESSAGE_FIELDS = ['id', 'text', 'sender_id', 'created_at'];

export const createMessage = (chatId, message) => axios
  .post(`/api/v1/chats/${chatId}/messages`, { ...message })
  .then((response) => response.data);

export const fetchMessages = (chatId, createdAt) => axios
  .get(`/api/v1/chats/${chatId}/messages`, { params: { created_at_until: createdAt, fields: MESSAGE_FIELDS } })
  .then((response) => response.data);

export const readMessages = (chatId) => axios
  .post(`/api/v1/chats/${chatId}/reads`)
  .then((response) => response.data);

export const fetchUsersWithoutChat = () => axios
  .get('/api/v1/users')
  .then((response) => response.data);

export const createChat = (userId) => axios
  .post('/api/v1/chats', { chat: { user_id: userId } })
  .then((response) => response.data);
