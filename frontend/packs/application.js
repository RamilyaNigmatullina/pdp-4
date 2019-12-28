import ReactRailsUJS from 'react_ujs';

import 'core-js/stable';

import 'config/application';
import 'modules';
import 'stylesheets/application.scss';

// Support component names relative to this directory:
const componentRequireContext = require.context('app/components', true);
ReactRailsUJS.useContext(componentRequireContext);
