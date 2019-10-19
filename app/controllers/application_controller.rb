class ApplicationController < ActionController::Base
  include Authentication

  prepend_view_path Rails.root.join("frontend", "views")

  responders :flash
  respond_to :html

  before_action :set_current

  def set_current
    Current.user = current_user
  end
end
