import React from 'react';
import { shallow } from 'enzyme';
import Message from '../index';

describe('Message', () => {
  let props;

  const render = () => shallow(<Message {...props} />);

  beforeEach(() => {
    props = {
      avatarUrl: '/avatar.jpg',
      isCurrentUserMessage: true,
      message: { id: 1, text: 'Hello world!' },
    };
  });

  it('renders message', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });

  describe('with interlocator message', () => {
    beforeEach(() => {
      props.isCurrentUserMessage = false;
    });

    it('renders message', () => {
      const component = render();

      expect(component).toMatchSnapshot();
    });
  });
});
