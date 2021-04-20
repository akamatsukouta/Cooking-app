Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'
  
  resources :cookings, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
end
