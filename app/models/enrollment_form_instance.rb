class EnrollmentFormInstance < ActiveRecord::Base
  belongs_to :enrollment_form
  belongs_to :user
  has_one :basic
  has_many :medications
  has_many :contacts
  has_one :questionnaire
  has_one :emergency
  has_many :allergies
end
