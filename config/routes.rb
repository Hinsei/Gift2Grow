Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :sessions, only: [:create]

resources :companies, only: [:new, :create, :edit, :show, :update, :destroy] do
	resources :giveaways
end

resources :participants

root 'welcome#index'
	delete "/sessions" => "sessions#destroy", :as => "logout"
	get "/sessions/new" => "session#new", :as => "login"
	get "/companies" => "companies#new", :as => "signup"
end
