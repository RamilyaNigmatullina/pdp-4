puts "=> Seeding started"

start_time = Time.current

ActiveRecord::Base.transaction do
  FactoryBot.create :admin, email: "admin@example.com"
  FactoryBot.create_list :user, 5
end

end_time = Time.current

puts "=> Seeding ended (#{end_time - start_time}s)"
