module Api
  module V1
    class MessagesController < BaseController
      expose_decorated :chat
      expose_decorated :message, parent: :chat

      def create
        message.save

        respond_with message, location: nil, fields: response_fields
      end

      private

      def message_params
        params.require(:message).permit(:text).merge(sender_id: current_user.id)
      end
    end
  end
end
