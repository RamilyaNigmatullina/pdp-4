import Cookies from 'js-cookie';
import I18n from 'i18n-js';
import 'vendor/translations';

const AVAILABLE_LOCALES = ['en'];
const currentLocale = AVAILABLE_LOCALES.find((locale) => locale === Cookies.get('locale'));

I18n.defaultLocale = 'en';
I18n.locale = currentLocale || I18n.defaultLocale;
