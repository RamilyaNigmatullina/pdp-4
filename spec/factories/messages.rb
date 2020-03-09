FactoryBot.define do
  factory :message do
    chat
    sender { [chat.first_user, chat.second_user].sample }
    text { Faker::Lorem.paragraph(sentence_count: rand(1..4)) }
    read_at { 1.day.ago }
  end
end
