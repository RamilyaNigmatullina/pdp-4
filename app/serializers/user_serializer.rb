class UserSerializer < ApplicationSerializer
  attributes :id, :full_name, :email, :avatar

  def avatar
    object.avatar.is_a?(String) ? object.avatar : "/images/avatar_32x32.png"
  end
end
