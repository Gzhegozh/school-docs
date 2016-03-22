class AddColumnsToEnrollmentFormInstances < ActiveRecord::Migration
  def change
    add_column :column_instances, :value, :string, null:false
    add_column :columns, :name, :string, null: false
    add_column :columns, :type, :string, null:false
    add_column :tabs, :name, :string, null:false
  end
end
