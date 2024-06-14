class Bike < ApplicationRecord
  belongs_to :user

  validates :brand, :model, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  # brand has to be one of these: Decathlon, Fisherprice, Trek
  validates :brand, inclusion: { in: %w[Decathlon Fisherprice Trek] }

  has_many :rents, dependent: :destroy
end
