Rails.application.routes.draw do
  get 'hairdressers/index'
  root to: "hairdressers#index"
end
