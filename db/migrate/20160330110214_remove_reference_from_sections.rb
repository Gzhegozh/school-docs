class RemoveReferenceFromSections < ActiveRecord::Migration
  def change
    remove_reference :enrollment_form_sections, :enrollment_form
  end
end
