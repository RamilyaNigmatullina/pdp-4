module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  env: {
    'browser': true,
    'jest/globals': true,
  },
  extends: [
    'airbnb-base',
    'plugin:react/recommended',
    'plugin:jest/recommended',
  ],
  plugins: [
    'react',
    'jest',
  ],
  settings: {
    'import/resolver': {
      webpack: {
        config: 'config/webpack/development.js',
      },
    },
  },
  globals: {},
  rules: {
    'import/extensions': ['error', 'always', {
      js: 'never',
      jsx: 'never',
    }],
    'import/no-extraneous-dependencies': 'off',
    'import/prefer-default-export': 'off',
    'no-param-reassign': ['error', {
      props: true,
      ignorePropertyModificationsFor: [
        'state',
        'acc',
        'e',
      ],
    }],
    'max-len': ["error", { "code": 120 }],
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-unused-expressions': ["error", { "allowTernary": true }],
    'arrow-parens': ["error", "always"],
    'class-methods-use-this': [0],
    'object-curly-newline': [0],
    'function-paren-newline': [0],
  },
};
