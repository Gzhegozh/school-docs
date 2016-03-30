class CreateEnrollmentForms < ActiveRecord::Migration
  def change
    create_table :enrollment_forms do |t|
      t.references :grade
      t.timestamps null: false
    end
  end
end
