class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user
      t.references :grade

      t.date :finished_at
      t.integer :mark

      t.timestamps null: false
    end
  end
end
