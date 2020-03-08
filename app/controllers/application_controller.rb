class ApplicationController < ActionController::Base
  include Authentication

  prepend_view_path Rails.root.join("frontend", "views")

  responders :flash
  respond_to :html

  private

  def after_sign_out_path_for(*)
    user_session_path
  end
end
