class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :targets

      t.references :enrollments

      t.timestamps null: false
    end
  end
end
