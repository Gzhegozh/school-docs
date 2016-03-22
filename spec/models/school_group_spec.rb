require 'rails_helper'

RSpec.describe SchoolGroup, type: :model do
  it "schoolGroup must be created" do
    school_group = SchoolGroup.create!(name: 'Minsk schools')
    expect(SchoolGroup.last.id).to eq(SchoolGroup.where(name: 'Minsk schools').limit(1).first.id)
  end
end
