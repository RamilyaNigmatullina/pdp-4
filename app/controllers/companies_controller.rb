class CompaniesController < ApplicationController
  expose_decorated :company

  def show
  end

  def new
    company.admin = User.new
  end

  def create
    binding.pry
    company.save

    respond_with company
  end

  private

  def company_params
    params.require(:company).permit(:name, :slug, admin_attributes: %i[email full_name password])
  end
end
