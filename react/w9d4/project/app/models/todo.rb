class Todo < ApplicationRecord
  validates :completed, inclusion: { in: [true, false] }
  validates :title, :body, presence: true

  
end
