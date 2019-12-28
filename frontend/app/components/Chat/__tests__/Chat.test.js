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
    it('add message to state', () => {
      component = instance();

      const expectedState = { messages: props.messages };

      expect(component.state).toEqual(expectedState);
    });
  });

  describe('#handleReceived', () => {
    it('add message to state', () => {
      component = instance();

      const message = {
        id: 1,
        text: 'How are you?',
        sender_id: 1,
      };
      const expectedState = { messages: [message, ...props.messages] };

      component.handleReceived(message);

      expect(component.state).toEqual(expectedState);
    });
  });
});
