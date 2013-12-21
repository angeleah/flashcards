Flashcards::Application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :cards, only: :show
  resources :quiz_sessions, only: [:create, :show ]

end
