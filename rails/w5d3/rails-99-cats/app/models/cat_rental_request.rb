class CatRentalRequest < ApplicationRecord
  STATUS = ['PENDING', 'DENIED', 'APPROVED']
  before_save :default_values
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUS
  validate :no_overlap_requests

  belongs_to :cat

  def default_values
    self.status = 'PENDING'
  end

  def overlapping_requests
      CatRentalRequest
      .where.not(id: id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date', start_date: start_date, end_date: end_date)
  end

  def no_overlap_requests
    unless self.overlapping_requests.empty?
        raise "This cat is not available on these dates"
    end
  end
end

