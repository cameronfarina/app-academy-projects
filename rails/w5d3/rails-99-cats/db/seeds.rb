# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "beginning to seed"


Tim = Cat.create!(birth_date: '2015/01/20', color: 'orange', sex: 'M', name: 'Tim', description: "Tim loves to walk around at night")
Tom = Cat.create!(birth_date: '2013/05/27', color: 'black', sex: 'M', name: 'Tom', description: "Tom does not get allong well with mice")
Garfield = Cat.create!(birth_date: '2015/01/20', color: 'orange', sex: 'M', name: 'Garfield', description: "Garfield hates Mondays")
Lily = Cat.create!(birth_date: '2014/01/20', color: 'white', sex: 'F', name: 'Lily', description: "Lily likes to be annoying")
Simon = Cat.create!(birth_date: '2013/05/20', color: 'black', sex: 'M', name: 'Simon', description: "Simon plays with the dogs")
Arya = Cat.create!(birth_date: '2011/04/20', color: 'gray', sex: 'F', name: 'Arya', description: "Does not get along well with white walkers")
request1 = CatRentalRequest.create!(cat_id: 1, start_date: ('2019/01/1'), end_date: ('2019/01/8'), status: 'PENDING')
request2 = CatRentalRequest.create!(cat_id: 2, start_date: ('2019/01/6'), end_date: ('2019/01/11'), status: 'PENDING')
request3 = CatRentalRequest.create!(cat_id: 2, start_date: ('2019/01/8'), end_date: ('2019/01/13'), status: 'PENDING')

puts 'finished seeding'