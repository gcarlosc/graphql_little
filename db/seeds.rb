# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }

SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
  'user1@example.com' => PROJECT_TITLES[0, OFFSET],
  'user2@example.com' => PROJECT_TITLES[OFFSET..-1]
}

PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password: 'password')
  projects.each { |title| user.projects.build(title: title) }
  user.save
end
