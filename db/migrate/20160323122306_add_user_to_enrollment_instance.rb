class AddUserToEnrollmentInstance < ActiveRecord::Migration
  def change
    add_reference :enrollment_form_instances, :user, index: true
  end
end
