class DeviseMailer < Devise::Mailer
  prepend_view_path Rails.root.join("frontend", "views")
  layout "mailer"

  def invitation_instructions(record, token, opts: {})
    @company = record.company
    @invited_by = record.invited_by
    super
  end

  protected

  def initialize_from_record(record)
    super
    instance_variable_set("@#{devise_mapping.name}", record.decorate)
  end
end
