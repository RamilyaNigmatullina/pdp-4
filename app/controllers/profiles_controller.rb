class ProfilesController < BaseController
  def edit
  end

  private

  def authorize_resource!
    authorize! current_user
  end
end
