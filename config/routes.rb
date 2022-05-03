Rails.application.routes.draw do
  root "campaigns#index"
  
  resources :campaigns
  resources :budgets

  namespace :api do
    namespace :v1 do
      resources :campaigns
      resources :budgets
    end
  end
end
