Rails.application.routes.draw do
  resources :payments
  root "payments#index"
end
