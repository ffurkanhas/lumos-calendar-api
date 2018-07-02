Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :calendars

      get 'calendars/search/:keyword', to: 'calendars#search'
    end
  end

  resources :calendars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
