Rails.application.routes.draw do

  resources :school_groups do
    resources :schools
  end

  resources :enrollment_form


  root to: 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}

  get  '/school_groups/:school_group_id/schools(.:format)' => 'schools#index', as: :schools_path
  post 'admin/set_admin/:id/' => 'admin#set_admin'
end
