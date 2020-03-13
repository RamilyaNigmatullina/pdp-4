module Api
  module V1
    class UsersController < BaseController
      expose :users, :fetch_users

      def index
        respond_with users, each_serializer: UserSerializer
      end

      private

      def authorize_resource!
        authorize! users, with: ::Chats::UserPolicy
      end

      def fetch_users
        FilteredUsersQuery.new(raw_users, filter_params, options).all
      end

      def raw_users
        current_company.users.active.where.not(id: current_user.id).order(:full_name)
      end

      def filter_params
        params.permit(:without_chat).to_h
      end

      def options
        { user: current_user }
      end
    end
  end
end
