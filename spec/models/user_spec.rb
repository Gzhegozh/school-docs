require 'rails_helper'

describe User do
  it 'Must have many grades' do
    should have_many(:grades).through(:enrollments)
  end
end
