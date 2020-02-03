class DeviseMailer < Devise::Mailer
  prepend_view_path Rails.root.join("frontend", "views")
  layout "mailer"

  protected

  def initialize_from_record(record)
    super
    instance_variable_set("@#{devise_mapping.name}", record.decorate)
  end
end
