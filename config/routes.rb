Flashcards::Application.routes.draw do

  root "pages#home"
  devise_for :users

  resources :quiz_sessions, only: [:create, :show]
  resources :stats, only: [:create, :show, :index]

  post 'answer', to: 'quiz_sessions#answer'

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end
