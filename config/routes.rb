Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :recipes, except: :update do
    resources :recipe_foods, except: :update
  end
  
end
