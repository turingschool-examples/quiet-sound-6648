require "rails_helper"

RSpec.describe "Doctor Show Page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "Denver Hospital") 
    @hospital_2 = Hospital.create!(name: "Boulder Hospital") 
    @doctor_1 = Doctor.create!(name:"Tommy", specialty:"Proctology", university: "University of Denver", hospital: @hospital_1 )
    @doctor_2 = Doctor.create!(name:"Michael", specialty:"Other-ology", university: "University of Boulder", hospital: @hospital_2 )
    @patient_1 = Patient.create!(name: "Kaelin", age: 32)
    @patient_2 = Patient.create!(name: "Bob", age: 25)
    @patient_3= Patient.create!(name: "Xavier", age: 48)
    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_1)
    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_2)
    DoctorPatient.create!(doctor: @doctor_2, patient: @patient_2)
    DoctorPatient.create!(doctor: @doctor_2, patient: @patient_3)
  end

  it "has a show page that shows doctor information" do
    visit doctor_path(@doctor_1)

    expect(page).to have_content("Name: #{@doctor_1.name}")
    expect(page).to have_content("Specialty: #{@doctor_1.specialty}")
    expect(page).to have_content("University: #{@doctor_1.university}")

    expect(page).to have_content("Hospital: #{@doctor_1.hospital.name}")

    within "#patients" do
      @doctor_1.patients.each do |patient|
        within "#patient_id-#{patient.id}" do
          expect(page).to have_content(patient.name)
        end
      end
    end
  end

end
