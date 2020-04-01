class PagesController < BaseController
  def index
  end

  private

  def authorize_resource!
    authorize! Company
  end
end
