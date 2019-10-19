class ApplicationMailer < ActionMailer::Base
  prepend_view_path Rails.root.join("frontend", "views")
  layout "mailer"

  default from: "from@example.com"
end
