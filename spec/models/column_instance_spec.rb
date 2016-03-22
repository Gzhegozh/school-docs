require 'rails_helper'

RSpec.describe ColumnInstance, type: :model do
  it 'Must belongs to tab_instance' do
    should belong_to(:tab_instance)
  end

  it 'Must belongs to column' do
    should belong_to(:column)
  end
end
