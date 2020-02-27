module Api
  module V1
    class ChatsController < BaseController
      def create
        respond_with create_chat.chat
      end

      private

      def authorize_resource!
        authorize! Chat
      end

      def create_chat
        @create_chat ||= CreateChat.call(current_user: current_user, chat_params: chat_params)
      end

      def chat_params
        params.require(:chat).permit(:user_id)
      end
    end
  end
end
