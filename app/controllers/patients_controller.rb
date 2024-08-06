class PatientsController < ApplicationController
  def index
    @patients_over_18 = Patient.patients_over_18
  end
end