class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.timestamps null: false
    end
    add_reference :relationships, :child, references: :users, index: true, null: false
    add_foreign_key :relationships, :users, column: :child_id

    add_reference :relationships, :parent, references: :users, index: true, null: false
    add_foreign_key :relationships, :users, column: :parent_id
  end
end
