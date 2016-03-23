class CreateEnrollmentFormInstances < ActiveRecord::Migration
  def change
    create_table :enrollment_form_instances do |t|
      t.references :enrollment_form
      t.timestamps null: false
    end
  end
end
