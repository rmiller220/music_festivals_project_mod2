Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/festivals", to: "festivals#index"
  get "/artists", to: "artists#index"
  get "/festivals/new", to: "festivals#new"
  post "/festivals", to: "festivals#create"
  get "/festivals/:id/edit", to: "festivals#edit"
  patch "/festivals/:id", to: "festivals#update"
  get "/festivals/:id/artists/new", to: "festival_artists#new"
  post "/festivals/:id/artists", to: "festival_artists#create"
  get "/festivals/:id", to: "festivals#show" 
  get "/artists/:id", to: "artists#show" 
  get "/festivals/:id/artists", to: "festival_artists#index"
end
