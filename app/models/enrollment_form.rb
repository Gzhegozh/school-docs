class EnrollmentForm < ActiveRecord::Base
  has_and_belongs_to_many :enrollment_form_sections
  belongs_to :grade
  accepts_nested_attributes_for :enrollment_form_sections
end
