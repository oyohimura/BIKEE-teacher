class Rent < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :start_date, :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  # status has to be one of these: pending, accepted, canceled and the default
  # value is pending
  validates :status, inclusion: { in: %w[pending accepted canceled] }, allow_nil: true

  def end_date
    start_date + duration.days
  end

  def total_price
    bike.price * duration
  end
end
