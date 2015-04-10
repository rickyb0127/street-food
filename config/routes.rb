Rails.application.routes.draw do
root 'welcome#index'

get 'sign-up', to: 'registrations#new'
post 'sign-up', to: 'registrations#create'
get 'sign-out', to: 'authentication#destroy'
get 'sign-in', to: 'authentication#new'
post 'sign-in', to: 'authentication#create'

resources :shopping_lists, only:[:index, :create]
resources :recipes, only:[:index, :show] do
  resources :comments, only:[:create, :edit, :update, :destroy]
end
resources :about, only:[:index]
resources :contact, only:[:index]
resources :careers, only:[:index]

end
