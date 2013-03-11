SecondQuarterlyProject::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :except => [:destroy, :index]

  resources :welcome, :only => [:index] do
    collection do
      get '/splash' => 'welcome#splash'
    end
  end

  resources :jobs do
    collection do
      get '/x' => 'jobs#x'
      get '/query' => 'jobs#query'
      post '/query' => 'jobs#import'
      post :order_list
      get '/scrape'
      post '/scrape' => 'jobs#cscrape'
    end
    member do
      get :select
      post :complete
    end
  end

  root :to => 'welcome#splash'
end
