class UserDecorator < ApplicationDecorator
  def avatar
    return object.avatar if object.avatar.attached?

    url_for("avatar_32x32.png")
  end
end
