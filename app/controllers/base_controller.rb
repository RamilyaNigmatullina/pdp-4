class BaseController < ApplicationController
  def current_company
    @current_company ||= Company.find_by(slug: request.subdomain)
  end
end
