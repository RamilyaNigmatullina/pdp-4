class ProfilesController < ApplicationController
  expose_decorated :user, :current_user

  def edit
  end

  def update
    user.update(user_params)

    respond_with(user, location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:full_name)
  end
end
