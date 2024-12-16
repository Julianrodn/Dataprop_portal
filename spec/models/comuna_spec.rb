require 'rails_helper'

RSpec.describe Comuna, type: :model do
  it "is valid with a unique name" do
    comuna = Comuna.new(name: "Providencia")
    expect(comuna).to be_valid
  end

  it "is invalid without a name" do
    comuna = Comuna.new(name: nil)
    expect(comuna).to_not be_valid
    expect(comuna.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a non-unique name" do
    Comuna.create!(name: "Providencia")
    comuna = Comuna.new(name: "Providencia")
    expect(comuna).to_not be_valid
    expect(comuna.errors[:name]).to include("has already been taken")
  end
end
