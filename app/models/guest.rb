class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy
  belongs_to :hotel

  validates :first_name, :last_name, :phone, :email, presence: true
end
