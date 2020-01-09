class ProfilesController < BaseController
  expose_decorated :user, :current_user

  def edit
  end

  def update
    user.update(user_params)

    respond_with(user, location: public_root_path)
  end

  private

  def authorize_resource!
    authorize! user
  end

  def user_params
    params.require(:user).permit(:full_name)
  end
end
