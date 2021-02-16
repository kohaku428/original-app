Rails.application.routes.draw do
  devise_for :users
  get 'hairdressers/index'
  root to: "hairdressers#index"
end
