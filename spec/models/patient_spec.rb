require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    describe '.patients_over_18' do
      it 'returns patients older than 18' do
        patient_1 = Patient.create!(name: "Kaelin", age: 32)
        patient_2 = Patient.create!(name: "Bob", age: 25)
        patient_3 = Patient.create!(name: "Xavier", age: 48)
        patient_4 = Patient.create!(name: "Young Patient", age: 17)

        expect(Patient.patients_over_18).to include(patient_1, patient_2, patient_3)
        expect(Patient.patients_over_18).not_to include(patient_4)
      end
    end
  end
end
