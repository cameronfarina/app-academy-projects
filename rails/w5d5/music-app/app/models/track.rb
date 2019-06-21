class Track < ApplicationRecord
  validates :name, :album_id, :ord, presence: true
  validates :ord, uniqueness: { scope: :album_id }
  validates :bonus, inclusion: [true, false]

  after_initialize :set_defaults

  belongs_to :album

  has_one :band,
  through: :album,
  source: :band

  has_many :notes,
  dependent: :destroy

  def set_defaults
    self.bonus ||= false
  end
end