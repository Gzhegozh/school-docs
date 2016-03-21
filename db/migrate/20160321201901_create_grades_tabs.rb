class CreateGradesTabs < ActiveRecord::Migration
  def change
    create_table :grades_tabs, :id => false do |t|
      t.references :grade
      t.references :tab
    end

    add_index :grades_tabs, [:grade_id, :tab_id],
      name: "grades_tabs_index",
      unique: true
  end
end
