Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:new, :create, :show, :edit, :update, :destroy] do
  	resources :giveaways
  end
end
