class ChatNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "notifications_for_user_#{current_user.id}"
  end
end
