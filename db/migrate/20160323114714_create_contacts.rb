class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :skype
      t.string :phone
      t.string :email

      t.references :enrollment_form_instance
      t.timestamps null: false
    end
  end
end
