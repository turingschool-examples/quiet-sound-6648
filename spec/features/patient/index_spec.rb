require "rails_helper"

RSpec.describe "Patient Index PAge" do
  before :each do
    @patient_1 = Patient.create!(name: "Kaelin", age: 32)
    @patient_2 = Patient.create!(name: "Bob", age: 25)
    @patient_3 = Patient.create!(name: "Xavier", age: 48)
    @patient_4 = Patient.create!(name: "Ashley", age: 65)
    @patient_5 = Patient.create!(name: "Chris", age: 42)
    @patient_6 = Patient.create!(name: "Daniel", age: 11)
  end

  it "displays all patients older than 18 in ascending order" do
    visit patients_path

    expect(page).to_not have_content(@patient_6.name)

    patient_names = all('#patients_over_18 div').map(&:text)

    expected_names = [@patient_4.name, @patient_2.name, @patient_5.name, @patient_1.name, @patient_3.name]

    expect(patient_names).to eq(expected_names)
  end

end