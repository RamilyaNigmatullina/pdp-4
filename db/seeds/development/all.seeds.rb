puts "=> Seeding started"

start_time = Time.current

ActiveRecord::Base.transaction do
end

end_time = Time.current

puts "=> Seeding ended (#{end_time - start_time}s)"
