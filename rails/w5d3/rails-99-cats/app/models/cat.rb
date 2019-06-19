class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ["orange", "white", "black", "gray"]

    validates :color, inclusion: COLORS
    validates :sex, inclusion: ["M", "F"]
    validates :name, :color, :birth_date, :sex, :description, presence: true

    has_many :cat_rental_requests,
    dependent: :destroy

    def age
      time_ago_in_words(birth_date)
    end


end