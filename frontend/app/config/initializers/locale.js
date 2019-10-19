import Cookies from 'js-cookie';
import 'vendor/translations';

const AVAILABLE_LOCALES = ['en'];
const currentLocale = AVAILABLE_LOCALES.find((locale) => locale === Cookies.get('locale'));

window.I18n.defaultLocale = process.env.I18N_DEFAULT_LOCALE;
window.I18n.locale = currentLocale || window.I18n.defaultLocale;
