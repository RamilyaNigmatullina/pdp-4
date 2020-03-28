puts "=> Seeding started"

def create_messages(chat, messages_count:)
  messages_count.times do
    sender_id = [chat.first_user_id, chat.second_user_id].sample
    FactoryBot.create(:message, chat: chat, sender_id: sender_id)
  end
end

def create_first_company
  admin = FactoryBot.create(:user, :admin, :john_smith)
  company = admin.company

  user_1 = FactoryBot.create(:user, email: "matthew.strickland@flatstack.com", full_name: "Matthew Strickland", company: company)
  user_2 = FactoryBot.create(:user, email: "mark.boone@flatstack.com", full_name: "Mark Boone", company: company)
  user_3 = FactoryBot.create(:user, email: "peter.atkinson@flatstack.com", full_name: "Peter Atkinson", company: company)

  FactoryBot.create_list(:user, 7, company: company)

  chat_1 = FactoryBot.create(:chat, first_user: admin, second_user: user_1)
  chat_2 = FactoryBot.create(:chat, first_user: admin, second_user: user_2)
  chat_3 = FactoryBot.create(:chat, first_user: admin, second_user: user_3)
  chat_4 = FactoryBot.create(:chat, first_user: user_1, second_user: user_2)
  chat_5 = FactoryBot.create(:chat, first_user: user_1, second_user: user_3)

  create_messages(chat_1, messages_count: 50)
  create_messages(chat_2, messages_count: 10)
  create_messages(chat_3, messages_count: 3)
  create_messages(chat_4, messages_count: 10)
  create_messages(chat_5, messages_count: 15)
end

def create_second_company
  second_company = FactoryBot.create(:company, name: "Samsung", slug: "samsung")
  second_admin = FactoryBot.create(:user, :admin, company: second_company, email: "admin@samsung.com", full_name: "Ronald Cooper")

  user_4 = FactoryBot.create(:user, email: "jacob.clark@samsung.com", full_name: "Jacob Clark", company: second_company)
  user_5 = FactoryBot.create(:user, email: "jasper.russell@samsung.com", full_name: "Jasper Russell", company: second_company)

  chat_6 = FactoryBot.create(:chat, first_user: second_admin, second_user: user_4)
  chat_7 = FactoryBot.create(:chat, first_user: second_admin, second_user: user_5)
  chat_8 = FactoryBot.create(:chat, first_user: user_4, second_user: user_5)

  create_messages(chat_6, messages_count: 10)
  create_messages(chat_7, messages_count: 5)
  create_messages(chat_8, messages_count: 5)

  FactoryBot.create_list(:user, 3, company: second_company)
end

start_time = Time.current

ActiveRecord::Base.transaction do
  create_first_company
  create_second_company
end

end_time = Time.current

puts "=> Seeding ended (#{end_time - start_time}s)"
