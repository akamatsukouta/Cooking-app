Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'
  
  resources :users, only: [:show]
  resources :cookings, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get 'search'
      get 'ranking'
    end
  end

end
