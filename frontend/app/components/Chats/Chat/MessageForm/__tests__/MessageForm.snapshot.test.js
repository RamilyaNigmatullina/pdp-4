import React from 'react';
import { shallow } from 'enzyme';
import MessageForm from '../index';

describe('MessageForm', () => {
  let props;

  const render = () => shallow(<MessageForm {...props} />);

  beforeEach(() => {
    props = {
      chatId: 1,
      currentUser: {
        id: 1,
        full_name: 'John Smith',
        avatar: '/john_smith_avatar.jpg',
      },
    };
  });

  it('renders message form', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });
});
