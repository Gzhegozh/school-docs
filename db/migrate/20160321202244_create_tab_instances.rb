class CreateTabInstances < ActiveRecord::Migration
  def change
    create_table :tab_instances do |t|
      t.references :enrollment
      t.references :tab
      t.timestamps null: false
    end
  end
end
