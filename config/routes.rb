Carogoverno::Application.routes.draw do
  match "admin/posts" => "admin/posts#index", :via => :get
  match "admin/posts/:id" => "admin/posts#show", :via => :get
  match "admin/posts/:id/delete" => "admin/posts#delete", :via => :delete

  #match "posts/index" => "posts#index", :via => :get
  #match "posts/new" => "posts#new", :via => :get
  #match "posts/detail/:id" => "posts#detail", :via => :get
  match "chi-siamo" => "home#chisiamo", :via => :get
  match "privacy" => "home#privacy", :via => :get
  match "il-team" => "home#team", :via => :get
  match "condizioni-utilizzo" => "home#condizioni", :via => :get
  match "aiutaci" => "home#aiutaci", :via => :get

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
