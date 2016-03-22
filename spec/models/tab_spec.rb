require 'rails_helper'

RSpec.describe Tab, type: :model do
  it 'Must have many tab instances' do
    should have_many(:tab_instances)
  end

  it 'Must have many columns' do
    should have_many(:columns)
  end

  it 'Must has_and_belongs_to_many with grades' do
    should have_and_belong_to_many(:grades)
  end
end
