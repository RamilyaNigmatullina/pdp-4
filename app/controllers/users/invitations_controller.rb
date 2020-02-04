module Users
  class InvitationsController < Devise::InvitationsController
    layout "public", only: %i[edit]

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: %i[email full_name company_id])
    end
  end
end
