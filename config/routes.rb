Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/customers/:customer_id/subscriptions", to: "subscriptions#create"
      patch "/customers/:customer_id/subscriptions/:subscription_id", to: "subscriptions#update"
      get "/customers/:customer_id/subscriptions", to: "subscriptions#index"
    end
  end
end
