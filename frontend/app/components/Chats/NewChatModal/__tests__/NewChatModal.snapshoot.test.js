import React from 'react';
import { shallow } from 'enzyme';
import NewChatModal from '../index';

describe('NewChatModal', () => {
  let props;

  const render = () => shallow(<NewChatModal {...props} />);

  beforeEach(() => {
    props = {
      onClose: jest.fn(),
      isShown: true,
      onChatCreate: jest.fn(),
    };
  });

  it('renders new chat modal', () => {
    const component = render();

    expect(component).toMatchSnapshot();
  });

  describe('when is not shown', () => {
    beforeEach(() => {
      props.isShown = false;
    });

    it('renders new chat modal', () => {
      const component = render();

      expect(component).toMatchSnapshot();
    });
  });
});
