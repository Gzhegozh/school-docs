class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :topic
      t.timestamps null: false
    end
  end
end
