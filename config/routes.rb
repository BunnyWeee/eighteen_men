Rails.application.routes.draw do
  resources :missions

  root 'mission#index'
end
