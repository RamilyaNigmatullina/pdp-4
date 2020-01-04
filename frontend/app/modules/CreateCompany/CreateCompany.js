import $ from 'jquery';

class CreateCompany {
  constructor() {
    this.companyInfo = $('.company-info');
    this.personalInfo = $('.personal-info');
    this.companyInfoLink = $('.company-info-link');
    this.personalInfoLink = $('.personal-info-link');
  }

  init() {
    this.companyInfoLink.on('click', this.toggleForm.bind(this));
    this.personalInfoLink.on('click', this.toggleForm.bind(this));
  }

  toggleForm(event) {
    event.preventDefault();
    this.companyInfo.toggleClass('d-none');
    this.personalInfo.toggleClass('d-none');
  }
}

export default CreateCompany;
