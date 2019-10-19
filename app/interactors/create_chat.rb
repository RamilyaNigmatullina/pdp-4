class CreateChat
  include Interactor

  delegate :chat, :current_user, :chat_params, to: :context

  def call
    context.chat = Chat.new(build_chat_params)

    context.fail! unless chat.save
  end

  def build_chat_params
    {
      first_user_id: current_user.id,
      second_user_id: chat_params[:user_id]
    }
  end
end
