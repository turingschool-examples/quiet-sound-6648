# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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