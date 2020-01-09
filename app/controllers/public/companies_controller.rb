module Public
  class CompaniesController < BaseController
    expose_decorated :company

    helper_method :step

    def show
    end

    def new
      company.admin = User.new
    end

    def create
      self.company = create_company.company

      respond_with company, location: company_root_url(subdomain: company.slug)
    end

    private

    def create_company
      @create_company ||= CreateCompany.call(company: company)
    end

    def step
      action_name == "create" ? create_company.step : 1
    end

    def company_params
      params
        .require(:company)
        .permit(:name, :slug, admin_attributes: %i[email full_name password password_confirmation])
    end
  end
end
