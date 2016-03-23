class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :target

      t.references :enrollment_form_instance
      t.timestamps null: false
    end
  end
end
