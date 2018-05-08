Rails.application.routes.draw do
  root 'welcome#index'

  post 'welcome/import' => 'welcome#import'
end
