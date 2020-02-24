module Api
  module V1
    module Chats
      class ReadsController < BaseController
        expose :chat

        def create
          chat.unread_messages_for(current_user).update_all(read_at: Time.current)

          head :ok
        end

        private

        def authorize_resource!
          authorize! chat, with: ReadsPolicy
        end
      end
    end
  end
end
