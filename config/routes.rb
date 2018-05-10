Rails.application.routes.draw do
  root 'welcome#index'

  resources :users do
    collection { post :import }
  end

end
