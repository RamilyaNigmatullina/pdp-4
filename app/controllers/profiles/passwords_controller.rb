module Profiles
  class PasswordsController < BaseController
    def edit
    end

    def update
      bypass_sign_in(current_user) if current_user.update_with_password(user_params)

      respond_with current_user, location: edit_profiles_passwords_path
    end

    private

    def authorize_resource!
      authorize! current_user, with: Profiles::PasswordPolicy
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
  end
end
