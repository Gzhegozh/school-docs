Rails.application.routes.draw do
  resources :schools
  resources :school_groups
  resources :schools
  root to: 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}
<<<<<<< HEAD

  get 'schools/new/:school_group_id' => 'schools#new'
  post 'admin/set_admin/:id/' => 'admin#set_admin'

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
      post :delete_from_trash
    end
  end
=======
  resources :messages
>>>>>>> a9dc60c9f416160e635b624739b92d0ea1177f68
end
