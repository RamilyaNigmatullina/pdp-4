FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    slug { Faker::Lorem.word }
  end
end
