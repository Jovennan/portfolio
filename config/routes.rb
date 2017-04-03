Rails.application.routes.draw do

    root :to => "home#index"
    resources :clients
    resources :programmers
    resources :projects
end
