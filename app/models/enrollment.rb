class Enrollment < ActiveRecord::Base
  has_many :tab_instances
end
