class CompaniesController < BaseController
  def edit
  end

  private

  def authorize_resource!
    authorize! current_company
  end
end
