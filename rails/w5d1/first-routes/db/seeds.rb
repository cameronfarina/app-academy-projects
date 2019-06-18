# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
puts 'Beginning to seed'

# users
user1 = User.create!(username: 'Billy')
user2 = User.create!(username: 'Tom')

# artworks
artwork1 = Artwork.create!(title: 'Mona Lisa', image_url: 'google.com', artist_id: user1.id) 
artwork2 = Artwork.create!(title: "Bingo Doctor", image_url: 'bing.com', artist_id: user2.id)

# artwork_shares
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)

#comments
comment1 = Comment.create!(body: 'This art smells like shit', user_id: user1.id, artwork_id: artwork1.id)
comment2 = Comment.create!(body: 'This is great art', user_id: user2.id,artwork_id: artwork2.id)

puts 'Finished seeding'