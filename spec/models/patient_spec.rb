require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    it '.adults returns adult patients in alphabetical order' do
      patient1 = Patient.create!(name: 'Zoidberg', age: 30)
      patient2 = Patient.create!(name: 'Bender', age: 25)
      patient3 = Patient.create!(name: 'Fry', age: 17)

      expect(Patient.adults).to eq([patient2, patient1])
    end
  end
end