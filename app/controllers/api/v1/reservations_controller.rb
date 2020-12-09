class Api::V1::ReservationsController < Api::V1::BaseController

  include Swagger::Blocks

  before_action :parse_start_time, only: [:create]
  before_action :set_guest, only: [:create]

  swagger_path '/reservations' do
    operation :post do
      key :summary, 'Create Reservation.'
      key :description, 'This function is used to Create Reservation.'
      key :tags, [
          'Reservations'
      ]
      key :produces, [
          'application/json'
      ]
      parameter do
        key :name, 'hotel_id'
        key :in, :query
        key :description, 'This should be the Hotel Id.'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, 'email'
        key :in, :query
        key :description, 'This should be the email of the user to sign up.'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'first_name'
        key :in, :query
        key :description, 'This should be the first name of the guest.'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'last_name'
        key :in, :query
        key :description, 'This should be the last name of the guest.'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'phone'
        key :in, :query
        key :description, 'This should be the phone of the user.'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'number_of_rooms'
        key :in, :query
        key :description, 'This should be the number of rooms for the guest.'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, 'departure_date'
        key :in, :query
        key :description, 'This should be the departure of the user.'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'arrival_date'
        key :in, :query
        key :description, 'This should be the arrival of the user.'
        key :required, true
        key :type, :string
      end
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def create
    if @guest.nil?
      @guest = Guest.create!(guest_params)
    end
    json_response(guest: @guest, reservation: @guest.create_reservation!(reservation_params.merge(guest_id: @guest.id)))
  end


  private

  def reservation_params
    params.permit(:hotel_id, :arrival_date, :departure_date, :number_of_rooms)
  end
  def guest_params
    params.permit( :first_name, :last_name, :phone, :email)
  end

  def set_guest
    @guest = Guest.find_by_email(params[:email])
  end

  def string_check
    params[:arrival_date].is_a?(String) and params[:departure_date].is_a?(String)
  end

  def parse_start_time
    return unless string_check

    params[:arrival_date] = Time.at(params[:arrival_date].to_i).to_datetime
    params[:departure_date] = Time.at(params[:departure_date].to_i).to_datetime
  end
end
