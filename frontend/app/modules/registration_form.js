class RegistrationForm {
  COMPANY_INFO_SELECTOR = ".company-info"
  PERSONAL_INFO_SELECTOR = ".personal-info"
  COMPANY_INFO_LINK_SELECTOR = ".company-info-link"
  PERSONAL_INFO_LINK_SELECTOR = ".personal-info-link"

  constructor() {
    console.log("Hello");
    this.companyInfo = $(this.COMPANY_INFO_SELECTOR);
    this.personalInfo = $(this.PERSONAL_INFO_SELECTOR);
    this.companyInfoLink = $(this.COMPANY_INFO_LINK_SELECTOR);
    this.personalInfoLink = $(this.PERSONAL_INFO_LINK_SELECTOR);

    this.bindEvents();
  }

  bindEvents() {
    this.companyInfoLink.on("click", this.toggleForm.bind(this));
    this.personalInfoLink.on("click", this.toggleForm.bind(this));
  }

  toggleForm() {
    event.preventDefault();
    this.companyInfo.toggleClass("d-none");
    this.personalInfo.toggleClass("d-none");
  }
}

if ($(".justify-content-center").length > 0) {
  new RegistrationForm();
}
