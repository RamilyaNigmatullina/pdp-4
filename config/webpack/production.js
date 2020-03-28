process.env.NODE_ENV = 'production';
const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer');

const environment = require('./environment');

if (process.env.REPORT) {
  environment.plugins.append('Report', new BundleAnalyzerPlugin());
}

environment.config.merge({ devtool: 'none' });

module.exports = environment.toWebpackConfig();
