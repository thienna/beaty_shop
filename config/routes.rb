Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "home#index"
    get "/product", to: "products#show"
    resource :cart, only: :show
    resources :orders, only: :index
  end
end
