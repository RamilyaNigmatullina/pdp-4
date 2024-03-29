module Api
  module V1
    class ProfilesController < BaseController
      def update
        current_user.update(user_params)

        respond_with current_user
      end

      private

      def authorize_resource!
        authorize! current_user
      end

      def user_params
        params.require(:user).permit(:full_name, :avatar)
      end
    end
  end
end
