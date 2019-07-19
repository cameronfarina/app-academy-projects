json.partial! "/api/guests/guest", guest: @guest
json.gifts @guest.gifts, partial: "/api/gifts/gift", as: :gift

  # json.array! @guest.gifts do |gift|
#    json.extract! gift, :title, :description
#     # json.partial! "/api/gifts/gift", gift: gift
#   end
# end

# json.array! @posts, partial: 'posts/post', as: :post
# json.gifts @guest.gifts do |gift|
#   json.extract! gift, :title, :description
# end #do |gift|
 # @guest.gift, :title, :description
#end

# json.author do 
#         json.extract! bleat.author, :id, :email 
#         json.authored_bleats do 
#             json.array! bleat.author.authored_bleat do |bleat|
#                 json.partial! "/api/bleats/bleat"
#     end

# json.array!  @bleats do |bleat|
    # json.set!(:id, bleat.id)
    # json.set!(:body, bleat.body)
    # json.set!(:author_id, bleat.author_id)  # can be re written as
    # json.id(bleat.id)
    # json.body bleat.body
    # json.author_id bleat.author_id #can be re written as
    # json,.extract!