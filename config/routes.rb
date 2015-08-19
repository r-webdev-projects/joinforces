Rails.application.routes.draw do

  # For user authentication
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks',
                                       registrations: 'users/registrations' }
  resources :users, only: ['show']

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
    resources :support
    get '/kickoff' => 'ideas#kickoff', as: :kickoff
  end

  # Root (homepage)
  root 'ideas#index'
end
