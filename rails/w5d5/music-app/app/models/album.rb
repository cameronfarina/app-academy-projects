class Album < ApplicationRecord
  validates :band, :name, :year, presence: true
  validates :live, inclusion: [true, false]
  validates :name, uniqueness: { scope: :band_id }
  
  after_initialize :set_defaults
  belongs_to :band

  has_many :tracks,
  dependent: :destroy

  def set_defaults
    self.live ||= false
  end
end