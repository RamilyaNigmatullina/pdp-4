module Api
  module V1
    class UsersController < BaseController
      expose :users, :fetch_users

      def index
        respond_with users, each_serializer: UserSerializer
      end

      private

      def authorize_resource!
        authorize! users
      end

      def fetch_users
        FilteredUsers.new(raw_users, filter_params).all
      end

      def raw_users
        current_company.users.active.where.not(id: current_user.id)
      end

      def filter_params
        params.permit(:without_chat).to_h
      end
    end
  end
end
