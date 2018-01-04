Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "dashboard#index"
      resource :category, only: :edit
      resources :categories, only: %i(index new)
      resource :product, only: :edit
      resources :products, only: %i(index new)
      resource :order, only: :edit
      resources :orders, only: :index
    end

    root "home#index"
    get "/product", to: "products#show"
    get "/login", to: "sessions#new"
    resource :cart, only: :show
    resources :orders, only: :index
  end
end
