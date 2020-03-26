class UserSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :full_name, :email, :avatar

  def avatar
    return url_for(object.avatar) if object.avatar.attached?

    url_for("/images/avatar_32x32.png")
  end
end
