Rails.application.routes.draw do
  namespace :api do
	  resources :todos, except: [:new, :edit]
  end

  resources :static_pages, only: [:index]
  root to: "static_pages#index"
end
