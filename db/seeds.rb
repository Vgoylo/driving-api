# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# BIRTHDAY = rand(Time.at(40.years.ago)..Time.at(20.years.ago))

50.times do |t|
  User.create(
    first_name: "#{Faker::Name.name.split(' ').first}",
    last_name: "#{Faker::Name.name.split(' ').first}",
    middle_name: "#{Faker::Name.name.split(' ').first}-#{Faker::Name.name.split(' ').last.slice(0..2)}",
    phone_number: "#{FakePhoneNumberGenerator.generate country: "BY"}",
    email: "#{Faker::Name.name.split(' ').first}@example.com",
    password: '123456',
    role: 0
  )
end
puts "Users completed!"

20.times do |t|
  Teacher.create(
    first_name: "#{Faker::Name.name.split(' ').first}",
    last_name: "#{Faker::Name.name.split(' ').first}",
    middle_name: "#{Faker::Name.name.split(' ').first}-#{Faker::Name.name.split(' ').last.slice(0..2)}",
    # date_of_birthday: "#{BIRTHDAY.year}-#{BIRTHDAY.month}-#{BIRTHDAY.day}",
    date_of_birthday: rand(Time.at(40.years.ago)..Time.at(20.years.ago)),
    phone_number: "+#{FakePhoneNumberGenerator.generate country: "BY"}",
    email: "#{Faker::Name.name.split(' ').first}@example.com",
    password: '123456',
    role: 0,
  )

end

def start_time
  times = []
  last_time = Time.parse('2000-01-01T20:00:00')
  cur_time = Time.parse('2000-01-01T09:00:00')

  while cur_time <= last_time
    times << cur_time
    cur_time = cur_time + 1.hour
  end

  return times[0...-1].sample
end

def end_time
  times = []
  last_time = Time.parse('2000-01-01T20:00:00')
  cur_time = Time.parse(start_time.to_s)

  while cur_time <= last_time
    times << cur_time
    cur_time = cur_time + 1.hour
  end

  return times[0...-1].sample
end

Teacher.all.each { |teacher|
  15.times do |t|
    TeacherTimeSlot.create!(
      teacher_id: teacher.id,
      weekdays: 6,
      start_work_time: start_time,
      end_work_time: end_time
    )
  end
}

puts "Teacher completed!"
puts "TeacherTimeSlot completed!"