import React from 'react';
import { shallow } from 'enzyme';
import ChatItem from '../index';

describe('ChatItem', () => {
  let props;

  const render = () => shallow(<ChatItem {...props} />);

  beforeEach(() => {
    props = {
      isCurrentChat: false,
      chat: {
        id: 1,
        unread_messages_count: 0,
        interlocutor: {
          id: 1,
          full_name: 'John Smith',
          avatar: '/john_smith_avatar.jpg',
        },
        last_message: {
          id: 1,
          text: 'Hello! How are you?',
          sender_id: 1,
          created_at: '2020-03-15T17:39:18.327Z',
        },
      },
      onClick: jest.fn(),
    };
  });

  it('renders chat item', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });

  describe('with unread messages', () => {
    beforeEach(() => {
      props.chat.unread_messages_count = 2;
    });

    it('renders chat item', () => {
      const component = render();

      expect(component).toMatchSnapshot();
    });
  });

  describe('with current chat', () => {
    beforeEach(() => {
      props.isCurrentChat = true;
    });

    it('renders chat item', () => {
      const component = render();

      expect(component).toMatchSnapshot();
    });
  });
});
