NtLookbook::Application.routes.draw do
  resources :photos, only: [:index, :show]
  root :to => "photos#index"
end
