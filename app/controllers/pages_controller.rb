class PagesController < BaseController
  def index
  end

  private

  def authorize_resource!
    authorize! current_company, with: CompanyPolicy
  end
end
