class UsersController < BaseController
  expose :user
  expose_decorated :users, :filtered_users

  helper_method :archived?

  def index
  end

  def destroy
    user.destroy

    respond_with user, location: users_path
  end

  private

  def filtered_users
    FilteredUsersQuery.new(fetch_users, filter_params).all
  end

  def fetch_users
    current_company.users.with_deleted.active.where.not(id: current_user.id)
  end

  def authorize_resource!
    authorize! users
  end

  def filter_params
    params.permit(:archived).reverse_merge(archived: false).to_h
  end

  def archived?
    ActiveModel::Type::Boolean.new.cast(filter_params[:archived])
  end
end
