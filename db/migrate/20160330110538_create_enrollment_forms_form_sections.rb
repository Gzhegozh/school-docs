class CreateEnrollmentFormsFormSections < ActiveRecord::Migration
  def change
    create_table :enrollment_form_sections_forms, :id => false do |t|
      t.references :enrollment_form
      t.references :enrollment_form_section
    end

    add_index :enrollment_form_sections_forms, [:enrollment_form_id, :enrollment_form_section_id],
      name: "enrollment_forms_sections_forms_index",
      unique: true
  end
end
