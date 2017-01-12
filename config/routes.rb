Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :sessions, only: [:new, :create, :destroy]

resources :companies, only: [:new, :edit, :show, :update, :destroy] do
	resources :giveaway
end

root 'welcome#index'
end
