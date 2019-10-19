import importAll from 'helpers/import';
import I18n from 'i18n-js';

window.I18n = I18n;

importAll(require.context('./initializers/', true, /\.js$/));
