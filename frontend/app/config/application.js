import importAll from 'helpers/import';

importAll(require.context('./initializers/', true, /\.js$/));
