class Rent < ApplicationRecord
  belongs_to :bike
  belongs_to :user
end
