class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.references :tab
      t.timestamps null: false
    end
  end
end
