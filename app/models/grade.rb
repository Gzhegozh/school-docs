class Grade < ActiveRecord::Base
  belongs_to :school
  has_one :enrollment_form
end
