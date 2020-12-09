class ApidocsController < ActionController::API
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'ReserveMe API\'s'
      key :description, 'ReserveMe API\'s'
      key :termsOfService, ''
      contact do
        key :name, 'ReserveMe API Team'
      end
      # license do
      #   key :name, ''
      # end
    end

    tag do
      key :name, 'Hotels'
      key :description, 'Reservations API\'s'
    end
    tag do
      key :name, 'Reservations'
      key :description, 'Reservations API\'s'
    end

    key :host, 'reservemenow.herokuapp.com'
    #key :host, 'localhost:3000'
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']

    # security_definition :SubscriberId do
    #   key :type, :apiKey
    #   key :name, :subscriber_id
    #   key :in, :query
    # end

  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
      Api::V1::ReservationsController,
      Api::V1::HotelsController,

      self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end