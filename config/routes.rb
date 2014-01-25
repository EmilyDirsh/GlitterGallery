Glitter::Application.routes.draw do

  resources :users, :projects
  resource :session, only: [:new, :create, :destroy]
  resource :comments
  resources :glitterposts 


  get 'projects/:id/commits' => 'projects#commits'
  get 'projects/:id/commit/:tree_id' => 'projects#projectcommit'
  get 'projects/:id/masterbranch/:image_name' => 'projects#masterbranch', :image_name => /[^\/]*/
  get 'projects/:id/masterbranch/:image_name/history' => 'projects#file_history', :image_name => /[^\/]*/
  get 'projects/:id/createsvg' => 'projects#new_svg'
  get 'projects/:id/newfile' => 'projects#newfile'
  get 'projects/:id/masterbranch/:image_name/edit' => 'projects#edit_svg', :image_name => /[^\/]*/
  get 'projects/:id/masterbranch/:image_name/update' => 'projects#update', :image_name => /[^\/]*/
  get 'projects/:id/fork' => 'projects#fork'
  get 'projects/:id/forkyou' => 'projects#forkyou'
  get 'projects/:id/pull' => 'projects#pull_request'
  get 'projects/:id/pull/:pull_id' => 'projects#pull'
  get 'projects/:id/pull/:pull_id/merge' => 'projects#merge'
  get 'projects/:id/pull/:pull_id/close' => 'projects#close'
  get 'projects/:id/pull/:pull_id/open' => 'projects#open'

  get 'projects/:id/pulls' => 'projects#pulls'
  
  resources :projects do
    member do
      get 'projects/:id/invite.xml' => 'projects#invite'

      post :file_upload
      post :file_update
      post :create_svg, :as => :create_svg
      post :edit_svg, :as => :edit_svg
      post :update_svg, :as => :update_svg
    end
  end

  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete

  get 'dashboard/' => 'dashboard#index', :as => :dashboard

  root :to => 'dashboard#index'

end
