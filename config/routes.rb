Rails.application.routes.draw do
  # For user authentication
  devise_for :users #, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  # Static Pages
  match '/about' => 'static_pages#about', via: 'get'
  match '/contact' => 'static_pages#contact', via: 'get'
  match '/signup' => 'static_pages#signup', via: 'get'
  match '/login' => 'static_pages#login', via: 'get'

  # Ideas
  resources :ideas do
    resources :comments do
      post 'heart', on: :member
      post 'break_up', on: :member
    end
    get '/kickoff' => 'ideas#kickoff', as: :kickoff
    get '/upvote' => 'ideas#upvote', as: :upvote
    get '/downvote' => 'ideas#downvote', as: :downvote
  end

  # Root (homepage)
  root 'ideas#index'
end
