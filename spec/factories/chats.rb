FactoryBot.define do
  factory :chat do
    association :first_user, strategy: :build, factory: :user
    association :second_user, strategy: :build, factory: :user
  end
end
