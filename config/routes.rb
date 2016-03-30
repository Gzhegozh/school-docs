Rails.application.routes.draw do

  resources :school_groups do
    resources :schools do
      resources :grades
    end
  end


  resources :enrollment_form


  root to: 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}

  get  '/school_groups/:school_group_id/schools(.:format)' => 'schools#index', as: :schools_path
  post 'admin/set_admin/:id/' => 'admin#set_admin'

  get '/school_groups/:school_group_id/schools/:school_id/grades/:id/choose_students' => 'grades#choose_students',
          as: :choose_students_school_group_school_grade

  post '/school_groups/:school_group_id/schools/:school_id/grades/:id/add_student/:student_id' => 'grades#add_student',
       as: :add_student_to_grade
  post '/school_groups/:school_group_id/schools/:school_id/grades/:id/delete_student/:student_id' => 'grades#delete_student',
       as: :delete_student_from_grade

  get '/users/index/' => 'users#index'
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
      post :delete_from_trash
      get  :chat   
    end
  end
end
