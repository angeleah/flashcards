Flashcards::Application.routes.draw do
  root "pages#home"
  devise_for :users

  resources :stats, only: [:create, :show, :index]

  resources :quiz_sessions, only: [:create, :show]

  post 'answer', to: 'quiz_sessions#answer'
  get 'unfinished', to: 'quiz_sessions#unfinished'

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end
