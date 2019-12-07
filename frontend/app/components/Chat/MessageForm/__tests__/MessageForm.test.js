import React from 'react';
import { mount } from 'enzyme';
import { createMessage } from 'components/Chat/api/index';
import MessageForm from '../index';

describe('MessageForm', () => {
  let props;
  let component;
  let button;
  let textarea;

  const render = () => mount(<MessageForm {...props} />);

  beforeEach(() => {
    props = {
      chatId: 1,
    };

    jest.fn(createMessage).mockImplementation(Promise.resolve);
    component = render();
    button = component.find('button');
    textarea = component.find('.message-form__textarea').instance();
  });

  it('sends message', () => {
    component.instance().handleSubmit = jest.fn();

    button.simulate('submit');

    expect(component.instance().handleSubmit).toHaveBeenCalled();
  });
});
