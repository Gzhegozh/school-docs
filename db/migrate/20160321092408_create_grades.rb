class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.string :dscription
      t.string :certificate_template_path
      t.references :school
      t.timestamps null: false
    end
  end
end
