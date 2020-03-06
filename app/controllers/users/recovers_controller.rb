module Users
  class RecoversController < BaseController
    expose :user, scope: :with_deleted

    def create
      User.with_deleted.restore(user.id, recursive: true)

      respond_with user, location: users_path
    end

    private

    def authorize_resource!
      authorize! Chat
    end
  end
end
