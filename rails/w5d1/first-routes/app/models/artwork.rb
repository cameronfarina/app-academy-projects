class Artwork < ApplicationRecord
  
  validates :title, uniqueness: { scope: :artist_id }

end
