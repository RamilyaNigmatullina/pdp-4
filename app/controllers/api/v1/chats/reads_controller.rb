module Api
  module V1
    module Chats
      class ReadsController
        expose :chat

        def create
          chat.unread_messages.update_all(read_at: Time.current)

          head :no_content
        end
      end
    end
  end
end
