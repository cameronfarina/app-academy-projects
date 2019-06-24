class Goal < ApplicationRecord
  validates :title, :user_id, :description, presence: true

  belongs_to :user
  has_many :comments
end