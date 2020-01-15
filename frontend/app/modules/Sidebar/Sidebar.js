import $ from 'jquery';

class Sidebar {
  constructor(menuToggle) {
    this.menuToggle = $(menuToggle);
    this.wrapper = $('#wrapper');
  }

  init() {
    this.menuToggle.click((e) => {
      e.preventDefault();
      this.wrapper.toggleClass('toggled');
    });
  }
}

export default Sidebar;
