import React from 'react';
import { shallow } from 'enzyme';
import Chat from '../index';

describe('Chat', () => {
  let props;

  const render = () => shallow(<Chat {...props} />);

  beforeEach(() => {
    props = {
      interlocutor: {
        id: 1,
        full_name: 'John Smith',
        avatar: '/john_smith_avatar.jpg',
      },
      currentUser: {
        id: 2,
        full_name: 'Kevin Doe',
        avatar: '/kevin_doe_avatar.jpg',
      },
      messages: [
        {
          id: 1,
          text: 'Hello, Kevin!',
          sender_id: 1,
        },
        {
          id: 2,
          text: 'Hello, John!',
          sender_id: 2,
        },
        {
          id: 1,
          text: 'How are you?',
          sender_id: 1,
        },
      ],
      chat: { id: 1 },
    };
  });

  it('renders chat', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });
});
