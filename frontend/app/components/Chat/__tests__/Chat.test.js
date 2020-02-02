import React from 'react';
import { shallow } from 'enzyme';
import Chat from '../index';

describe('Chat', () => {
  let props;
  let component;

  const instance = () => shallow(<Chat {...props} />).instance();

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
      ],
      chat: { id: 1 },
    };
  });

  describe('#constructor', () => {
    it('initializes state', () => {
      component = instance();

      const expectedState = { isLastPage: false, messages: props.messages, page: 2 };

      expect(component.state).toEqual(expectedState);
    });
  });
});
