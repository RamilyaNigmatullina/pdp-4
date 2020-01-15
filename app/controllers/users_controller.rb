class UsersController < BaseController
  expose_decorated :users, :fetch_users

  def index
  end

  private

  def fetch_users
    current_company.users.where.not(id: current_user.id)
  end

  def authorize_resource!
    authorize! users
  end
end
