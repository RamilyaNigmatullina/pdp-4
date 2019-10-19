class UsersController < ApplicationController
  expose_decorated :users, :fetch_users

  def index
  end

  private

  def fetch_users
    User.where.not(id: current_user.id)
  end
end
