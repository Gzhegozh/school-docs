class TabInstance < ActiveRecord::Base
  has_many :columns, through: :column_instances
end
