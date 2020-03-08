FactoryBot.define do
  factory :user do
    confirmed_at { 1.hour.ago }
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    password { "password" }
    password_confirmation { password }

    before(:create) do |user|
      user.company ||= user.admin? ? build(:company, admin: user) : build(:company)
    end

    trait :admin do
      role { "admin" }
    end

    trait :archived do
      deleted_at { 1.day.ago }
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
        user.company = create :company, :flatstack, admin: user
      end
    end

    trait :kevin_doe do
      email { "kevin.doe@example.com" }
      full_name { "Kevin Doe" }
    end
  end
end
