import importAll from 'helpers/import';
import './registration_form.js';

importAll(require.context('./', true, /index\.js$/));
