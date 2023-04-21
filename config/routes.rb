Rails.application.routes.draw do # get 'current_user/index'

  match '/current_user', to: 'users/user#curr_user', via: 'get'
  match '/users', to: 'users/user#index',   via: 'get'
  match '/edit_user', to: "users/user#update", via: 'patch'
  match 'users/:id', to: "users/user#show", via: 'get'

  match '/avatar', to: "users/avatar#update", via: 'patch'
  match '/avatar', to: "users/avatar#destroy", via: 'delete'
  match '/photos/:photo_id/likes', to: "likes#destroy", via: 'delete'


  devise_for :users,
  path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
    
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  
  resources :photos do
    resources :likes
    resources :comments
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
