class AddColumnToEnrollmentFormSection < ActiveRecord::Migration
  def change
    add_column :enrollment_form_sections, :name, :string
  end
end
