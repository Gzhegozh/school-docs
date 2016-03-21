class Tab < ActiveRecord::Base
  has_and_belongs_to_many :grades
  has_many :tab_instances
  has_many :columns
end
