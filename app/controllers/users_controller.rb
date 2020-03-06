class UsersController < BaseController
  expose :user
  expose_decorated :users, :fetch_users

  def index
  end

  def destroy
    user.destroy

    respond_with user, location: users_path
  end

  private

  def fetch_users
    current_company.users.active.where.not(id: current_user.id)
  end

  def authorize_resource!
    authorize! users
  end
end
