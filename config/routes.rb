Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "dashboard#index"
      resources :categories, except: :show
      resource :product, only: :edit
      resources :products, only: %i(index new)
      resource :order, only: :edit
      resources :orders, only: :index
    end

    root "home#index"
    get "/product", to: "products#show"
    resource :cart, only: :show
    resources :orders, only: :index

    devise_for :user, path: "",
      path_names: {sign_in: "login", sign_out: "logout"}
  end
end
