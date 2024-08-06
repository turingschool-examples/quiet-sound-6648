class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    doctor = doctor_patient.doctor
    doctor_patient.destroy
    redirect_to doctor_path(doctor)
  end
end
