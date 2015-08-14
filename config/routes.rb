Rails.application.routes.draw do
  # For user authentication
  devise_for :users #, :controllers => { registrations: 'registrations' }

  # Static Pages
  match '/about' => 'static_pages#about', via: 'get'
  match '/contact' => 'static_pages#contact', via: 'get'

  # Ideas
  resources :ideas do
    resources :comments
    resources :support
    get '/kickoff' => 'ideas#kickoff', as: :kickoff
  end

  # Root (homepage)
  root 'ideas#index'
end
