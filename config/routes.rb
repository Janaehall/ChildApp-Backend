Rails.application.routes.default_url_options[:host] = "localhost:3000"
Rails.application.routes.draw do
  resources :milestones
  resources :comments
  resources :likes
  resources :posts
  resources :child_families
  resources :parent_children
  resources :children
  resources :users, except: :show
  get '/users/:id', to: 'users#show', constraints: { id: /[^\/]+/}
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  patch 'children/:id/add_video', to: 'children#add_video'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
