# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# COLORS = %w(orange brown black white)
# SEX = ['M', 'F']

Cat.destroy_all
# bigglesworth = Cat.create!(name: 'Mr. Bigglesworth', color: 'black', birth_date: '2015/01/20', sex: 'M')
# 10.times do
#   Cat.create!(birth_date: Faker::Date.birthday(0, 21), color: COLORS[rand(0..3)], name: Faker::Name.unique.name, sex: SEX[rand(0..1)])
# end

User.destroy_all
person = User.create!(user_name: 'Me')
10.times do
  User.create!(user_name: Faker::Name.unique.name)
end


