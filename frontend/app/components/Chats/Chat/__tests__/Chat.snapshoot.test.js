import React from 'react';
import { shallow } from 'enzyme';
import Chat from '../index';

describe('Chat', () => {
  let props;

  const render = () => shallow(<Chat {...props} />);

  beforeEach(() => {
    props = {
      chat: {
        id: 1,
        unread_messages_count: 0,
        interlocutor: {
          id: 2,
          full_name: 'Kevin Doe',
          avatar: '/kevin_doe_avatar.jpg',
        },
        last_message: {
          id: 1,
          text: 'Hello! How are you?',
          sender_id: 1,
          created_at: '2020-03-15T17:39:18.327Z',
        },
      },
      currentUser: {
        id: 1,
        full_name: 'John Smith',
        avatar: '/john_smith_avatar.jpg',
      },
      onMessageReceived: jest.fn(),
    };
  });

  it('renders chat', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });
});
