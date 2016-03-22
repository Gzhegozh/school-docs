class TabInstance < ActiveRecord::Base
  has_many :columns, through: :column_instances
  has_many :column_instances
  belongs_to :enrollment
  belongs_to :tab
end
