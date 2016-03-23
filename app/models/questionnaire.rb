class Questionnaire < ActiveRecord::Base
  belongs_to :enrollment_form_instance
end
