class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :hotel

  validates :arrival_date, :departure_date, :number_of_rooms, presence: true
end
