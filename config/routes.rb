Rails.application.routes.draw do
  resources :payments do
    put :request_payment, on: :member
  end
  root "payments#index"
end
