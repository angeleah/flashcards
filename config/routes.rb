Flashcards::Application.routes.draw do

  root "pages#home"
  devise_for :users

  resources :quiz_sessions, only: [:create, :show] do
    member do
      get 'stats'
      post 'answer'
    end
  end
end
