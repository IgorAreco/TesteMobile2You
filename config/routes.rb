Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/create_by_csv', to: 'netflix_movies#create_by_csv'
      resources :netflix_movies, only: [ :index ]
    end
  end
end
