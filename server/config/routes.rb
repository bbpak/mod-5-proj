Rails.application.routes.draw do
  # get '/users/:id/projects', to: 'users#projects'
  get '/users/:username', to: 'users#show'
  get '/projects/:project', to: 'projects#show'
  get '/projects/tags', to: 'projects#tags'
  post '/projects/tags', to: 'projects#create_tag'
  
  
  resources :users, only: [:index, :create, :update, :destroy] do
    resources :follows, only: [:index, :create, :destroy], shallow: true
  end
  resources :projects, only: [:index, :create, :update, :destroy] do
    resources :project_likes, only: [:index, :create, :destroy], shallow: true
  end

  get '/auth/github', to: 'authentication#github', format: false
  get '/signout', to: 'authentication#signout'
end