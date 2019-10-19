import axios from 'axios';
import { getCsrf } from 'helpers/selectors';

const csrfProtectionHeaders = getCsrf();
const jsonHeaders = { 'Content-Type': 'application/json' };

Object.assign(axios.defaults.headers.common, csrfProtectionHeaders, jsonHeaders);
