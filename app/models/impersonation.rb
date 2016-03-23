class Impersonation < ActiveRecord::Base
  belongs_to :user
  belongs_to :impersonator, class: 'User'
end
