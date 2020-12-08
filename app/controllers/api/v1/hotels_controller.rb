class Api::V1::HotelsController < Api::V1::BaseController

  include Swagger::Blocks


  def search
  end


  private

  def search_params
    params.permit(:first_name, :last_name, :phone, :email)
  end
end
