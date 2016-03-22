class Enrollment < ActiveRecord::Base
  has_many :tab_instances
  belongs_to :user
  belongs_to :grade
end
