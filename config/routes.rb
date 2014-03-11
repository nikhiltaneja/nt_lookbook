require 'resque/server'

NtLookbook::Application.routes.draw do
  mount Resque::Server, :at => "/resque"

  resources :photos, only: [:show]
  root :to => "photos#show"
end
