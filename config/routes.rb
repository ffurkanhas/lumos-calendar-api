Rails.application.routes.draw do
  resources :calendars

  get '/calendars/search/:keyword', to: 'calendars#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
