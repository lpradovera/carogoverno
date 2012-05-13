Carogoverno::Application.routes.draw do
  match "admin/posts" => "admin/posts#index", :via => :get
  match "admin/posts/:id" => "admin/posts#show", :via => :get
  match "admin/posts/:id/delete" => "admin/posts#delete", :via => :delete

  #match "posts/index" => "posts#index", :via => :get
  #match "posts/new" => "posts#new", :via => :get
  #match "posts/detail/:id" => "posts#detail", :via => :get

  devise_for :users

  resources :posts, :only => [:index, :show, :new, :create] do
    member do
      post 'voteup'
      post 'votedown'
      post 'report'
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end

  
  root :to => "home#index"

end
