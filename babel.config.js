module.exports = function babelConfig(api) {
  const isDevelopmentEnv = api.env('development');
  const isProductionEnv = api.env('production');
  const isTestEnv = api.env('test');

  const presets = [
    isTestEnv && [
      '@babel/env', {
        targets: {
          node: 'current',
        },
      },
    ],
    (isProductionEnv || isDevelopmentEnv) && [
      '@babel/env', {
        forceAllTransforms: true,
        useBuiltIns: 'entry',
        corejs: 3,
        modules: false,
        exclude: ['transform-typeof-symbol'],
      },
    ],
    [
      '@babel/react', {
        development: isDevelopmentEnv || isTestEnv,
        useBuiltIns: true,
      },
    ],
  ];

  const plugins = [
    'babel-plugin-macros',
    '@babel/plugin-syntax-dynamic-import',
    isTestEnv && 'babel-plugin-dynamic-import-node',
    '@babel/plugin-transform-destructuring',
    ['@babel/plugin-proposal-class-properties', { loose: true }],
    ['@babel/plugin-proposal-object-rest-spread', { useBuiltIns: true }],
    ['@babel/plugin-transform-runtime', { helpers: false, regenerator: true, corejs: false }],
    ['@babel/plugin-transform-regenerator', { async: false }],
    isProductionEnv && ['babel-plugin-transform-react-remove-prop-types', { removeImport: true }],
  ];

  return {
    presets: presets.filter(Boolean),
    plugins: plugins.filter(Boolean),
  };
};
