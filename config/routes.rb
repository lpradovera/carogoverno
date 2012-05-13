Carogoverno::Application.routes.draw do
  #match "posts/index" => "posts#index", :via => :get
  #match "posts/new" => "posts#new", :via => :get
  #match "posts/detail/:id" => "posts#detail", :via => :get
  match "chi-siamo" => "home#chisiamo", :via => :get

  devise_for :users

  resources :posts, :only => [:index, :show, :new, :create] do
    member do
      post 'voteup'
      post 'votedown'
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end

  
  root :to => "home#index"

end
