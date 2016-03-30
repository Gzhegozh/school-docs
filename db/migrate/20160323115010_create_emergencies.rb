class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :person
      t.string :info

      t.references :enrollment_form_instance
      t.timestamps null: false
    end
  end
end
