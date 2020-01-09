class CompaniesController < BaseController
  expose_decorated :company

  def edit
  end

  def update
  end

  private

  def authorize_resource!
    authorize! company
  end

  def company_params
    params.require(:company).permit(:name, :slug)
  end
end
