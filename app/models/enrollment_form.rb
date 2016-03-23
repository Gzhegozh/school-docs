class EnrollmentForm < ActiveRecord::Base
  belongs_to :grade
  has_many :enrollment_form_sections
end
