class CreateColumnInstances < ActiveRecord::Migration
  def change
    create_table :column_instances do |t|
      t.references :tab_instance
      t.references :column
      t.timestamps null: false
    end
  end
end
