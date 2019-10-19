export const getCsrf = () => {
  const csrfTokenNode = document.querySelector('meta[name=csrf-token]');

  return csrfTokenNode ? csrfTokenNode.content : null;
};
