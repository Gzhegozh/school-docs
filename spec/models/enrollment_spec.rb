require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it 'Must has many tab instances' do
    should have_many(:tab_instances)
  end

  it 'Must belongs to user' do
    should belong_to(:user)
  end

  it 'Must belongs to grade' do
    should belong_to(:grade)
  end
end
