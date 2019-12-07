import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

Enzyme.configure({ adapter: new Adapter() });

jest.mock('helpers/selectors', () => ({
  getCsrf: () => 'csrf_token',
}));
