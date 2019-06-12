class ShortenedUrl < ApplicationRecord
     validates :short_url, uniqueness: true, presence: true


     def self.random_code

          until ShortenedUrl.exists?(short_url: random_code)
          random_code = SecureRandom.urlsafe_base64
          end
          return random_code unless ShortenedUrl.exists?(short_url: random_code)
     end
end