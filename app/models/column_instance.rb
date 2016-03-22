class ColumnInstance < ActiveRecord::Base
  belongs_to :tab_instance
  belongs_to :column
end
