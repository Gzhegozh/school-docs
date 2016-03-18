Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'user/registrations', 
                                      sessions: 'user/sessions',
                                      passwords: 'user/passwords'}
end
