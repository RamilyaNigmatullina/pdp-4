module Api
  module V1
    class MessagesController < BaseController
      expose_decorated :chat
      expose_decorated :message, parent: :chat
      expose_decorated :messages, :fetch_messages

      def index
        respond_with messages, each_serializer: MessageSerializer, fields: response_fields
      end

      def create
        if message.save
          ChatChannel.broadcast_to chat, serialized_message

          head :created
        else
          head :unprocessable_entity
        end
      end

      private

      def authorize_resource!
        authorize! message
      end

      def fetch_messages
        chat.messages.order(created_at: :desc).page(params[:page])
      end

      def message_params
        params.require(:message).permit(:text).merge(sender_id: current_user.id)
      end

      def serialized_message
        MessageSerializer.new(message).as_json
      end
    end
  end
end
