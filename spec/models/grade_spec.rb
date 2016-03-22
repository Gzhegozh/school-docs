require 'rails_helper'

RSpec.describe Grade, type: :model do
  it 'Must have many users through enrollments' do
    should have_many(:users).through(:enrollments)
  end

  it 'Should has_and_belongs_to_many relation with tabs' do
    should have_and_belong_to_many(:tabs)
  end
end
