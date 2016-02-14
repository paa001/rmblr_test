Rails.application.routes.draw do
  devise_for :users
  root 'translations#index'
  resources :translations, only: [:index, :show]

  namespace :admin do
    root 'translations#index'
    resources :translations, only: [:index, :new, :create, :show] do
      resources :translation_messages, only: :create
    end
  end
end
