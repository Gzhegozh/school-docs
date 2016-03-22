require 'rails_helper'

RSpec.describe TabInstance, type: :model do
  it 'Must belongs to tab' do
    should belong_to(:enrollment)
  end

  it 'Must belong to tab' do
    should belong_to(:tab)
  end

  it 'Must have many columns through column_instance' do
    should have_many(:columns).through(:column_instances)
  end
end
