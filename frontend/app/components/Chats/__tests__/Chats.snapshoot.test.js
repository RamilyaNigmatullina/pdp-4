import React from 'react';
import { shallow } from 'enzyme';
import Chats from '../index';

describe('Chats', () => {
  let props;

  const render = () => shallow(<Chats {...props} />);

  beforeEach(() => {
    props = {
      chats: [
        {
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
        {
          id: 1,
          unread_messages_count: 2,
          interlocutor: {
            id: 3,
            full_name: 'Mark Boone',
            avatar: '/mark_boone_avatar.jpg',
          },
          last_message: {
            id: 1,
            text: 'Are you working?',
            sender_id: 1,
            created_at: '2020-03-15T15:00:10.327Z',
          },
        },
      ],
      currentUser: {
        id: 1,
        full_name: 'John Smith',
        avatar: '/john_smith_avatar.jpg',
      },
    };
  });

  it('renders chats', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });

  describe('without chats', () => {
    beforeEach(() => {
      props.chats = [];
    });

    it('renders chats', () => {
      const component = render();

      expect(component).toMatchSnapshot();
    });
  });
});
