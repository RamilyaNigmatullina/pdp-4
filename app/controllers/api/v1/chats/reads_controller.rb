module Api
  module V1
    module Chats
      class ReadsController < BaseController
        expose :chat
        expose :chats, :fetch_chats

        def create
          chat.unread_messages.update_all(read_at: Time.current)

          respond_with chats, each_serializer: ChatSerializer
        end

        private

        def authorize_resource!
          authorize! chat
        end

        def fetch_chats
          Chat
            .left_outer_joins(:last_message)
            .where(id: current_user.chats.ids)
            .includes(first_user: :avatar_attachment, second_user: :avatar_attachment)
            .order("messages.created_at IS NULL, messages.created_at DESC")
            .uniq
        end
      end
    end
  end
end
