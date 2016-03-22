class AddingIndexToEnrollments < ActiveRecord::Migration
  def change
    add_index :enrollments, [:user_id, :grade_id]
  end
end
