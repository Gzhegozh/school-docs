class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :middle_name
      t.date :birthday
      t.references :user

      t.timestamps null: false
    end
  end
end
