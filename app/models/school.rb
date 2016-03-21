class School < ActiveRecord::Base
  belongs_to :school_group
  has_many :grades
end
