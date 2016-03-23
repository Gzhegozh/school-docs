# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.exists?(email: 'root@me.com')
  user = User.new(
      email: 'root@me.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  user.add_role 'super_admin'
  user.save
end

['student1@gmail.com','student2@gmail.com','student3@gmail.com','student4@gmail.com','student5@gmail.com'].each do |email|
  unless User.exists?(email: email)
    user = User.new(
        email: email,
        password: '12345678',
        password_confirmation: '12345678'
    )
    user.add_role 'student'
    user.save
  end
end

['parent1@gmail.com','parent2@gmail.com','parent3@gmail.com','parent4@gmail.com','parent5@gmail.com'].each do |email|
  unless User.exists?(email: email)
    user = User.new(
        email: email,
        password: '12345678',
        password_confirmation: '12345678'
    )
    user.add_role 'parent'
    user.save
  end
end

['admin1@gmail.com','admin2@gmail.com','admin3@gmail.com','admin4@gmail.com'].each do |email|
  unless User.exists?(email: email)
    user = User.new(
        email: email,
        password: '12345678',
        password_confirmation: '12345678'
    )
    user.add_role 'admin'
    user.save
  end
end

