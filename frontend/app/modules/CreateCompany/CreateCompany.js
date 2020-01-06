import $ from 'jquery';

class CreateCompany {
  constructor() {
    this.companyInfo = $('.company-info');
    this.personalInfo = $('.personal-info');
    this.companyInfoLink = $('.company-info-link');
    this.personalInfoLink = $('.personal-info-link');
    this.companyNameInput = $('#company_name');
    this.adminFullNameInput = $('#company_admin_attributes_full_name');
  }

  init() {
    this.companyInfoLink.on('click', this.showCompanyInfo);
    this.personalInfoLink.on('click', this.showProfileInfo);
  }

  showCompanyInfo = (event) => {
    event.preventDefault();
    this.toggleForm();
    this.companyNameInput.focus();
  }

  showProfileInfo = (event) => {
    event.preventDefault();
    this.toggleForm();
    this.adminFullNameInput.focus();
  }

  toggleForm() {
    this.companyInfo.toggleClass('d-none');
    this.personalInfo.toggleClass('d-none');
  }
}

export default CreateCompany;
