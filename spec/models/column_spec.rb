require 'rails_helper'

RSpec.describe Column, type: :model do
  it 'Must belong to tab' do
    should belong_to(:tab)
  end

  it 'Must have many tab instances through column instance' do
    should have_many(:tab_instances).through(:column_instances)
  end
end
