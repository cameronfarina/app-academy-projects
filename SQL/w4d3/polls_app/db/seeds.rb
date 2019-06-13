# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

a = User.create!(username: 'anthony')
c = User.create!(username: 'cameron')

pa = a.authored_polls.create!(title: "I am the bworst title")
pc = c.authored_polls.create!(title: "camerons title")