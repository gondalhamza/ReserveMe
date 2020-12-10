class Hotel < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, :city, :number_of_rooms, :price, presence: true

  # arrival and departure date, number of rooms, and max price per room per night

  def self.searchs params
    hotels = Hotel.all
    hotels = hotels.where(name: params[:state]) if params[:state]
    hotels = hotels.where(city: params[:city]) if params[:city]
    hotels = hotels.where(street: params[:street]) if params[:street]
    hotels
  end

  def self.with_name param
    where("name LIKE :search", search: param[:name])
  end

  def self.with_city param
    where("city LIKE :search", search: param[:city])
  end

  def self.with_number_of_rooms param
    where("number_of_rooms LIKE :search", search: param[:number_of_rooms])
  end

end
