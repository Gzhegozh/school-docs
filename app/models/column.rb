class Column < ActiveRecord::Base
  has_many :tab_instances, through: :column_instances
end
