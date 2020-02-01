FactoryBot.define do
  factory :user do
    company
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    password { "123456" }
    password_confirmation { password }

    trait :admin do
      role { "admin" }
    end

    trait :not_confirmed do
      confirmed_at { nil }

      after(:create) do |user|
        user.update(confirmation_sent_at: 3.days.ago)
      end
    end

    trait :john_smith do
      email { "john.smith@example.com" }
      full_name { "John Smith" }

      before(:create) do |user|
        user.company = create :company, :flatstack
      end
    end
  end
end
