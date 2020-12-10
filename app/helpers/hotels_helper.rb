module HotelsHelper

  def filter_hotels(scope = Hotel.all)
    filters = params.permit(:name, :city, :number_of_rooms).to_h.compact
    scope = scope.where(filters) if filters.any?
    scope
  end

  def filter_hotel
    scope = Hotel.all
    scope.where("name LIKE :search", search: params[:name]) if params[:name]
    scope.where("city LIKE :search", search: params[:city]) if params[:city]
    scope.where("number_of_rooms LIKE :search", search: params[:number_of_rooms]) if params[:number_of_rooms]
    scope.distinct
  end

end
