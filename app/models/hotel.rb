class Hotel < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, :city, :number_of_rooms, :price, presence: true

end
