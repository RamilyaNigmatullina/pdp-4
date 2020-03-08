FactoryBot.define do
  factory :message do
    association :sender, factory: :user
    text { Faker::Lorem.paragraph(sentence_count: rand(1..4)) }
    read_at { 1.day.ago }
  end
end
