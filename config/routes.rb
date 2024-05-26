Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'publics/registrations',
    sessions: 'public/sessions'
  }
  
  root to: 'homes#top'
  get 'index', to: 'homes#index', as: 'index'
  get 'about', to: 'homes#about', as: 'about'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
