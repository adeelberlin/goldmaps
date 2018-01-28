Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :nodes

  get '/api_doc', to: 'static#api'

  namespace :api do
    namespace :v1 do
      resources :nodes, only:[:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
