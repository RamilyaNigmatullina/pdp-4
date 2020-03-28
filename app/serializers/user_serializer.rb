class UserSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers

  attributes :id, :full_name, :email, :avatar

  def avatar
    return rails_blob_url(object.avatar, subdomain: "www") if object.avatar.attached?

    url_for("/images/avatar_32x32.png")
  end
end
