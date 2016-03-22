class Grade < ActiveRecord::Base
  has_and_belongs_to_many :tabs
  belongs_to :school
  has_many :enrollments
  has_many :users, through: :enrollments
end
