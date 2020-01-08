class BaseController < ApplicationController
  helper_method :current_company

  def current_company
    @current_company ||= Company.find_by(slug: request.subdomain)
  end
end
