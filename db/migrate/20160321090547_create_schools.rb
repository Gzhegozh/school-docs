class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.references :school_group
      t.timestamps null: false
    end
  end
end
