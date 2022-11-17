Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :categories, except: [:update, :edit] do
    resources :payments, except: [:update, :edit]
  end
  
end
