DoctorPatient.destroy_all
Doctor.destroy_all
Patient.destroy_all
Hospital.destroy_all

# Hospitals
hospital1 = Hospital.create!(name: 'Sacred Heart')
hospital2 = Hospital.create!(name: 'Seattle Grace')

# Doctors
doctor1 = hospital1.doctors.create!(name: 'Dr. Cox', specialty: 'Sarcasm', university: 'Harvard')
doctor2 = hospital1.doctors.create!(name: 'Dr. Turk', specialty: 'Surgery', university: 'Johns Hopkins')
doctor3 = hospital2.doctors.create!(name: 'Dr. House', specialty: 'Diagnostic Medicine', university: 'Princeton')
doctor4 = hospital2.doctors.create!(name: 'Dr. Wilson', specialty: 'Oncology', university: 'Yale')

# Patients
patient1 = Patient.create!(name: 'John Doe', age: 39)
patient2 = Patient.create!(name: 'Jane Doe', age: 28)
patient3 = Patient.create!(name: 'Jimmy Neutron', age: 17)
patient4 = Patient.create!(name: 'Timmy Turner', age: 20)
patient5 = Patient.create!(name: 'Carl Wheezer', age: 25)

# Doctor-Patient Relationships
DoctorPatient.create!(doctor: doctor1, patient: patient1)
DoctorPatient.create!(doctor: doctor1, patient: patient2)
DoctorPatient.create!(doctor: doctor2, patient: patient3)
DoctorPatient.create!(doctor: doctor3, patient: patient1)
DoctorPatient.create!(doctor: doctor3, patient: patient4)
DoctorPatient.create!(doctor: doctor4, patient: patient5)
DoctorPatient.create!(doctor: doctor4, patient: patient2)
