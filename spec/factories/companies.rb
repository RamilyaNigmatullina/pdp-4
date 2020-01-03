FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    slug { Faker::Lorem.word }

    after(:build) do |company|
      company.admin ||= build :user, company: company
    end
  end
end
