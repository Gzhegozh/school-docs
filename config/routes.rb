Rails.application.routes.draw do
<<<<<<< HEAD
  resources :school_groups do
    resources :schools
  end
=======
  resources :schools
  resources :school_groups
  resources :schools
  resources :enrollment_form
>>>>>>> 2a3ee3e1ad12abd64e8b6f3dbe68c9c8a595ac59

  root to: 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}

  get  '/school_groups/:school_group_id/schools(.:format)' => 'schools#index', as: :schools_path
  post 'admin/set_admin/:id/' => 'admin#set_admin'
end
