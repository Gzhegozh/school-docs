require 'rails_helper'

RSpec.describe Grade, type: :model do
  it 'Must have one enrollment form' do
    should have_one(:enrollment_form)
  end

  it 'Must belongs to school' do
    should belong_to(:school)
  end
end
