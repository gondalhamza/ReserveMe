class Api::V1::ReservationsController < Api::V1::BaseController

  include Swagger::Blocks

  before_action :parse_start_time, only: [:create]
  before_action :set_guest, only: [:create]


  def create
    json_response(@guest.create_reservation!(reservation_params.merge(hotel_id: params[:hotel_id])))
  end


  private

  def reservation_params
    params.require(:reservation).permit(:guest_id, :hotel_id, :arrival_date, :departure_date, :number_of_rooms)
  end

  def set_guest
    @guest = Guest.find(params[:guest_id])
  end

  def string_check
    params[:reservation][:start_time].is_a?(String) and params[:reservation][:departure_date].is_a?(String)
  end

  def parse_start_time
    return unless string_check

    params[:reservation][:arrival_date] = Time.at(params[:reservation][:arrival_date].to_i).to_datetime
    params[:reservation][:departure_date] = Time.at(params[:reservation][:departure_date].to_i).to_datetime
  end
end
