FactoryBot.define do
  factory :chat do
    after(:build) do |chat|
      company = build :company
      first_user = build :user, company: company
      second_user = build :user, company: company

      chat.first_user ||= first_user
      chat.second_user ||= second_user
    end
  end
end
