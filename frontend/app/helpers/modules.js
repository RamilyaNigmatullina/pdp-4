import { onLoad } from 'helpers/load';

export const initializeModule = (Module, querySelector, ...moduleArgs) => {
  onLoad(() => {
    const $fields = document.querySelectorAll(querySelector);

    [...$fields].forEach(($field) => {
      const module = new Module($field);

      module.init(moduleArgs);
    });
  });
};
