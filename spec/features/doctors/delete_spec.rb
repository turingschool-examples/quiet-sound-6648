require 'rails_helper'

RSpec.describe 'Remove a patient from a doctor', type: :feature do
  it 'removes a patient from a doctor caseload' do
    hospital = Hospital.create!(name: 'Sacred Heart')
    doctor1 = hospital.doctors.create!(name: 'Dr. House', specialty: 'Diagnostic Medicine', university: 'Princeton')
    doctor2 = hospital.doctors.create!(name: 'Dr. Wilson', specialty: 'Oncology', university: 'Yale')
    patient = Patient.create!(name: 'John Doe', age: 39)

    DoctorPatient.create!(doctor: doctor1, patient: patient)
    DoctorPatient.create!(doctor: doctor2, patient: patient)

    visit doctor_path(doctor1)

    within "#patient-#{patient.id}" do
      click_button 'Remove'
    end

    expect(current_path).to eq(doctor_path(doctor1))
    expect(page).to_not have_content(patient.name)

    visit doctor_path(doctor2)

    expect(page).to have_content(patient.name)
  end

  it 'does not affect other doctor patients when removing a patient' do
    hospital = Hospital.create!(name: 'Sacred Heart')
    doctor1 = hospital.doctors.create!(name: 'Dr. House', specialty: 'Diagnostic Medicine', university: 'Princeton')
    doctor2 = hospital.doctors.create!(name: 'Dr. Wilson', specialty: 'Oncology', university: 'Yale')
    patient1 = Patient.create!(name: 'John Doe', age: 39)
    patient2 = Patient.create!(name: 'Jane Doe', age: 28)

    DoctorPatient.create!(doctor: doctor1, patient: patient1)
    DoctorPatient.create!(doctor: doctor1, patient: patient2)
    DoctorPatient.create!(doctor: doctor2, patient: patient1)

    visit doctor_path(doctor1)

    within "#patient-#{patient1.id}" do
      click_button 'Remove'
    end

    expect(current_path).to eq(doctor_path(doctor1))
    expect(page).to_not have_content(patient1.name)
    expect(page).to have_content(patient2.name)

    visit doctor_path(doctor2)

    expect(page).to have_content(patient1.name)
  end
end