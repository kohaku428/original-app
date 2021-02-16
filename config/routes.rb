Rails.application.routes.draw do
  devise_for :users
  root to: "hairdressers#index"
  resources :hairdressers, only: [:index, :new, :create, :show]
end
