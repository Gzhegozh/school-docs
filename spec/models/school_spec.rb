require 'rails_helper'

RSpec.describe School, type: :model do
  it 'Must belongs to SchoolGroup' do
    should belong_to(:school_group)
  end

  it 'Must have many Grades' do
    should have_many(:grades)
  end
end
