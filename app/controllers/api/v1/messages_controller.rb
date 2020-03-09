module Api
  module V1
    class MessagesController < BaseController
      expose_decorated :chat
      expose_decorated :message, parent: :chat
      expose_decorated :messages, :filtered_messages

      def index
        respond_with messages, each_serializer: MessageSerializer, fields: response_fields
      end

      def create
        if message.save
          ChatChannel.broadcast_to chat, serialized_message
          ChatNotificationsChannel.broadcast_to "notifications_for_user_#{chat_interlocutor.id}", serialized_chat

          head :created
        else
          head :unprocessable_entity
        end
      end

      private

      def authorize_resource!
        authorize! message
      end

      def filtered_messages
        FilteredMessagesQuery.new(fetch_messages, filter_params).all
      end

      def fetch_messages
        chat.messages.order(created_at: :desc).limit(25)
      end

      def message_params
        params.require(:message).permit(:text).merge(sender_id: current_user.id)
      end

      def filter_params
        params.permit(:created_at_until).reverse_merge(created_at_until: Time.zone.now).to_h
      end

      def serialized_message
        MessageSerializer.new(message).as_json
      end

      def serialized_chat
        ChatSerializer.new(chat, user: chat_interlocutor).as_json
      end

      def chat_interlocutor
        @chat_interlocutor ||= chat.interlocutor(current_user)
      end
    end
  end
end
