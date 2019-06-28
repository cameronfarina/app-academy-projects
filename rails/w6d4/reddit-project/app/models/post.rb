class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author, foreign_key: :user_id, class_name: :User
    has_many :post_subs, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub
end