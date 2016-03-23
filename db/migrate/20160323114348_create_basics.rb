class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.string :name
      t.string :last_name
      t.string :middle_name
      t.date :birthday

      t.references :enrllment_form_instance
      t.timestamps null: false
    end
  end
end
