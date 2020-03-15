import React from 'react';
import { shallow } from 'enzyme';
import Interlocator from '../index';

describe('Interlocutor', () => {
  let props;

  const render = () => shallow(<Interlocator {...props} />);

  beforeEach(() => {
    props = {
      interlocutor: {
        id: 1,
        full_name: 'John Smith',
        avatar: '/john_smith_avatar.jpg',
      },
    };
  });

  it('renders interlocutor info', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });
});
