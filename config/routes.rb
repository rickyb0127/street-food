Rails.application.routes.draw do
root 'welcome#index'

get 'sign-up', to: 'registrations#new'
post 'sign-up', to: 'registrations#create'
get 'sign-out', to: 'authentication#destroy'
get 'sign-in', to: 'authentication#new'
post 'sign-in', to: 'authentication#create'

resources :recipes, only:[:index, :show] do
  resources :comments, only:[:create]
end
resources :about, only:[:index]
resources :contact, only:[:index]
resources :careers, only:[:index]

end
