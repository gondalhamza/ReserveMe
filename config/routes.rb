Rails.application.routes.draw do

  # SWAGGER
  root to: redirect('/swagger/dist/index.html')
  resources :apidocs, only: [:index]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :reservations, only: [:create]

      resources :hotels do
        collection do
          get 'search', to: 'hotels#search'
        end
      end

    end
  end

end
