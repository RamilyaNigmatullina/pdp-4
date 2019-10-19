const { environment } = require('@rails/webpacker');
const dotenv = require('dotenv');

dotenv.config();

environment.loaders.delete('nodeModules');

module.exports = environment;
