Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :sessions, only: [:new, :create, :destroy]

resources :companies, only: [:new, :create, :edit, :show, :update, :destroy] do
	resources :giveaway
end

root 'welcome#index'
	delete "/sessions" => "sessions#destroy", :as => "logout"
	get "/sessions" => "session#new", :as => "login"
	get "/companies" => "companies#new", :as => "signup"
end
