class Api::V1::HotelsController < Api::V1::BaseController

  include Swagger::Blocks

  swagger_path '/hotels/search' do
    operation :get do
      key :summary, 'Search Hotels.'
      key :description, 'This function is used to Search Hotels.'
      key :tags, [
          'Hotels'
      ]
      key :produces, [
          'application/json'
      ]
      parameter do
        key :name, 'number_of_rooms'
        key :in, :query
        key :description, 'This should be the number of rooms for the guest.'
        key :required, false
        key :type, :integer
      end
      parameter do
        key :name, 'departure_date'
        key :in, :query
        key :description, 'This should be the departure of the user.'
        key :required, false
        key :type, :string
      end
      parameter do
        key :name, 'arrival_date'
        key :in, :query
        key :description, 'This should be the arrival of the user.'
        key :required, false
        key :type, :string
      end
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def search
    json_response(Hotel.all)
  end


  private

  def search_params
    params.permit(:first_name, :last_name, :phone, :email)
  end
end
