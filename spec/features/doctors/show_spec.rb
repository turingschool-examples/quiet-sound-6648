require 'rails_helper'

RSpec.describe 'Doctor show page', type: :feature do
  it 'shows the doctor information and the hospital they work for and their patients' do
    hospital = Hospital.create!(name: 'Sacred Heart')
    doctor = hospital.doctors.create!(name: 'Dr. Cox', specialty: 'Sarcasm', university: 'Harvard')
    patient1 = Patient.create!(name: 'Patient Zero', age: 39)
    patient2 = Patient.create!(name: 'Test Dummy', age: 32)
    
    DoctorPatient.create!(doctor: doctor, patient: patient1)
    DoctorPatient.create!(doctor: doctor, patient: patient2)

    visit doctor_path(doctor)

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(doctor.university)
    expect(page).to have_content(hospital.name)
    within("#patient-#{patient1.id}") do
      expect(page).to have_content(patient1.name)
    end
    within("#patient-#{patient2.id}") do
      expect(page).to have_content(patient2.name)
    end
  end

  it 'does not show patients not associated with the doctor' do
    hospital = Hospital.create!(name: 'Sacred Heart')
    doctor1 = hospital.doctors.create!(name: 'Dr. Cox', specialty: 'Sarcasm', university: 'Harvard')
    doctor2 = hospital.doctors.create!(name: 'Dr. House', specialty: 'Diagnostic Medicine', university: 'Princeton')
    patient1 = Patient.create!(name: 'Patient Zero', age: 39)
    patient2 = Patient.create!(name: 'Test Dummy', age: 32)
    
    DoctorPatient.create!(doctor: doctor1, patient: patient1)

    visit doctor_path(doctor1)

    expect(page).to have_content(patient1.name)
    expect(page).to_not have_content(patient2.name)
  end

  it 'shows correctly if the doctor has no patients' do
    hospital = Hospital.create!(name: 'Sacred Heart')
    doctor = hospital.doctors.create!(name: 'Dr. Cox', specialty: 'Sarcasm', university: 'Harvard')

    visit doctor_path(doctor)

    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(doctor.university)
    expect(page).to have_content(hospital.name)
    expect(page).to have_selector('h2', text: 'Patients:')
    expect(page).to_not have_selector('li')
  end
end