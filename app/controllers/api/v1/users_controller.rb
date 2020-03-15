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
        UsersWithoutChatWithUserQuery.new(raw_users, user: current_user).all
      end

      def raw_users
        current_company.users.active.where.not(id: current_user.id).order(:full_name)
      end
    end
  end
end
