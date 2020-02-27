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
          ChatNotificationsChannel.broadcast_to "notifications_for_user_#{chat.interlocutor.id}", chat_info

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
        @serialized_message ||= MessageSerializer.new(message).as_json
      end

      def serialized_user
        UserSerializer.new(current_user).as_json
      end

      def chat_info
        {
          id: chat.id,
          last_message: serialized_message,
          unread_messages_count: chat.unread_messages_for(chat.interlocutor).count,
          interlocutor: serialized_user
        }
      end
    end
  end
end
