Rails.application.routes.draw do
  resources :schools
  resources :school_groups
  resources :schools
  root to: 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}

  post 'admin/set_admin/:id/' => 'admin#set_admin'
end
