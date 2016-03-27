class FixGradesColumnName < ActiveRecord::Migration
  def change
    rename_column :grades, :dscription, :description
  end
end
