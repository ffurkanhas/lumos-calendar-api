Rails.application.routes.draw do
  namespace :calendar do
    namespace :api do
      namespace :v1 do
        resources :events
        resources :users
        get 'events/search/:keyword', to: 'events#search'
      end
    end
  end

  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end