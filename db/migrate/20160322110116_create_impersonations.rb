class CreateImpersonations < ActiveRecord::Migration
  def change
    create_table :impersonations do |t|
      t.datetime :started_at
      t.datetime :finished_at

      t.references :enrollments

      t.timestamps null: false
    end

    add_reference :impersonations, :impersonator, references: :users, index: true, null: false
    add_foreign_key :impersonations, :users, column: :impersonator_id

    add_reference :impersonations, :user, references: :users, index: true, null: false
    add_foreign_key :impersonations, :users, column: :user_id
  end
end
