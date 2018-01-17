Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "dashboard#index"
      resources :categories, only: %i(index new create edit update destroy)
      resources :products, only: %i(index new create edit update destroy)
      resources :orders, only: %i(index show update destroy)
      resources :order_details, only: %i(update destroy)
    end

    root "home#index"
    get "/product", to: "products#show"
    resource :cart, only: :show
    resources :orders, only: :index

    devise_for :user, path: "",
      path_names: {sign_in: "login", sign_out: "logout"}
  end
end
