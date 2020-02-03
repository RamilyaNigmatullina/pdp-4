class DeviseMailerPreview < ActionMailer::Preview
  def invitation_instructions
    user = FactoryBot.build_stubbed(:user)
    second_user = FactoryBot.build_stubbed(:user, invited_by: user, invitation_created_at: Time.zone.now)

    DeviseMailer.invitation_instructions(second_user, "fake_token", {})
  end
end
