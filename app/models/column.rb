class Column < ActiveRecord::Base
  has_many :tab_instances, through: :column_instances
  has_many :column_instances

  belongs_to :tab
end
