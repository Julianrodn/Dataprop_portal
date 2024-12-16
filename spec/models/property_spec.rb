require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:user) { create(:user) }
  let(:comuna) { create(:comuna) }
  let(:property) { build(:property, user: user, comuna: comuna) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:comuna) }
    it { should have_many_attached(:photos) }
  end

  describe 'validations' do
    it 'validates presence of price' do
      property.price = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:price]).to include("can't be blank")
    end

    it 'validates price is greater than 0' do
      property.price = -1
      expect(property.valid?).to be_falsey
      expect(property.errors[:price]).to include('must be greater than 0')
    end

    it 'validates presence of comuna' do
      property.comuna = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:comuna]).to include("can't be blank")
    end

    it 'validates presence of address' do
      property.address = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:address]).to include("can't be blank")
    end

    it 'validates presence of latitude' do
      property.latitude = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:latitude]).to include("can't be blank")
    end

    it 'validates presence of longitude' do
      property.longitude = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:longitude]).to include("can't be blank")
    end

    it 'validates description format (no contact information)' do
      property.description = 'Contact us at test@example.com for more info'
      expect(property.valid?).to be_falsey
      expect(property.errors[:description]).to include('no debe contener datos de contacto')
    end

    it 'validates property_type inclusion' do
      property.property_type = 'Alquiler'
      expect(property.valid?).to be_falsey
      expect(property.errors[:property_type]).to include('is not included in the list')
    end

    it 'validates photos attachment on create' do
      property.photos = nil
      expect(property.valid?).to be_falsey
      expect(property.errors[:photos]).to include("can't be blank")
    end

    it 'validates price with a valid value' do
      property.price = 500000
      expect(property.valid?).to be_truthy
    end
  end
end
