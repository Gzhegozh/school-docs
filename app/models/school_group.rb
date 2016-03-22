class SchoolGroup < ActiveRecord::Base
  has_many :schools
  resourcify
end
