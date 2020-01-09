class BaseController < ApplicationController
  include Authorization

  before_action \
    :authorize_resource!
    :authenticate_user!

  protect_from_forgery with: :exception
end
