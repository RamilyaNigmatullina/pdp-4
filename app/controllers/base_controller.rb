class BaseController < ApplicationController
  include Authorization

  before_action \
    :authenticate_user!,
    :authorize_resource!

  protect_from_forgery with: :exception
end
