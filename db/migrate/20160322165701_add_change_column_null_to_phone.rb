class AddChangeColumnNullToPhone < ActiveRecord::Migration
  def change
    change_column_null :profiles, :phone, true
  end
end
