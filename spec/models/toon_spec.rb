require 'rails_helper'

RSpec.describe Toon, type: :model do
  it 'should validate presence of name' do
    toon = Toon.create(
      age: 1,
      enjoys_doing: 'test',
      image: 'www.com'
    )
    expect(toon.errors[:name]).to_not be_empty
  end
  it 'should validate presence of age' do
    toon = Toon.create(
      name: 'Patrick',
      enjoys_doing: 'test',
      image: 'www.com'
    )
    expect(toon.errors[:age]).to_not be_empty
  end
  it 'should validate presence of enjoys_doing' do
    toon = Toon.create(
      name: 'Patrick',
      age: 1,
      image: 'www.com'
    )
    expect(toon.errors[:enjoys_doing]).to_not be_empty
  end
  it 'should validate presence of image' do
    toon = Toon.create(
      name: 'Patrick',
      age: 1,
      enjoys_doing: 'test'
    )
    expect(toon.errors[:image]).to_not be_empty
  end
  it 'validates that enjoys_doing is at least 10 characters long' do
    toon = Toon.create(
      name: 'Patrick',
      age: 1,
      enjoys_doing: 'test',
      image: 'www.com'
    )
    expect(toon.errors[:enjoys_doing]).to_not be_empty
  end
end
