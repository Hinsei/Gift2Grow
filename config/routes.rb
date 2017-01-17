Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :sessions, only: [:create]

	resources :companies do
		resources :giveaways
	end

  resources :participants

  root 'welcome#index'

	delete "/sessions" => "sessions#destroy", :as => "logout"
	get "/sessions/new" => "sessions#new", :as => "login"
	post "/sessions/new" => "sessions#create"
	get "/companies/new" => "companies#new", :as => "signup"
	get "/:giveaway_link/:referral_identification" => "giveaways#show"
	get "/:giveaway_link" => "giveaways#show"
  get "/welcome/about" => "welcome#about", :as => "about"


end
