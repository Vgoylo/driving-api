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

100.times do |t|
  User.create!(
    first_name: "#{Faker::Name.name.split(' ').first}",
    last_name: "#{Faker::Name.name.split(' ').last}",
    middle_name: "#{Faker::Name.name.split(' ').first}-#{Faker::Name.name.split(' ').last.slice(0..2)}",
    phone_number: "+#{FakePhoneNumberGenerator.generate country: "BY"}",
    email: "#{t}#{Faker::Name.name.split(' ').last.slice(0..4)}@exampl.com",
    password: '123456',
    role: 0
  )
end

puts "Users completed!"

70.times do |t|
  Teacher.create(
    first_name: "#{Faker::Name.name.split(' ').first}",
    last_name: "#{Faker::Name.name.split(' ').last}",
    middle_name: "#{Faker::Name.name.split(' ').first}-#{Faker::Name.name.split(' ').last.slice(0..2)}",
    # date_of_birthday: "#{BIRTHDAY.year}-#{BIRTHDAY.month}-#{BIRTHDAY.day}",
    date_of_birthday: rand(Time.at(40.years.ago)..Time.at(20.years.ago)),
    phone_number: "+#{FakePhoneNumberGenerator.generate country: "BY"}",
    email: "#{Faker::Name.name.split(' ').first.slice(0..2)}@examples.com",
    password: '123456',
    role: 0,
  )

end

Teacher.all.each { |teacher|
  teacher_profile = TeacherProfile.create!(
    price: '50 BYN',
    unp: '123456789',
    teacher_id: teacher.id
  )

  teacher.teacher_profile.avatar
         .attach(io: File.open("/home/vgoylo/HomeWork/My-project/driving-api/madagaskar-1.jpg"), filename: 'avatar')
  teacher.teacher_profile.driving_licence
         .attach(io: File.open("/home/vgoylo/HomeWork/My-project/driving-api/download.jpeg"), filename: 'driving_licence')

  15.times do |t|
    TeacherTimeSlot.create!(
      teacher_id: teacher.id,
      weekdays: 6,
      start_work_time: start_time,
      end_work_time: end_time
    )
  end

  User.all.each do |user|
    15.times do |t|
      UserTimeSlot.create!(
        user_id: user.id,
        teacher_id: teacher.id,
        weekdays: 6,
        start_work_time: start_time,
        end_work_time: end_time
      )
    end
  end
}

puts "Teacher completed!"
puts "TeacherProfile completed!"
puts "TeacherTimeSlot completed!"
puts "UserTimeSlot completed!"
