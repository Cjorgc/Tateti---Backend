Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	resources :users ,only: [:index,:show] do
		collection do
			post :register
			post :login
			get :logout
		end
	end

	resources :boards , only: [:index, :create, :show] do
		collection do
			post :move
		end
	end
			


end
