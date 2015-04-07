Rails.application.routes.draw do
root 'welcome#index'

resources :recipes, only:[:index]
end
