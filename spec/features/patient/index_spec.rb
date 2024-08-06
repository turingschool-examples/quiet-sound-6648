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

  it "displays all patients older that 18 in ascending order" do
    visit patients_path

    within "#patients_over_18" do
      expect(page).to_not have_css("#patient_id-#{@patient_6.id}")
      expect(page).to have_css("#patient_id-#{@patient_4.id}")
      expect(page).to have_css("#patient_id-#{@patient_2.id}")
      expect(page).to have_css("#patient_id-#{@patient_5.id}")
      expect(page).to have_css("#patient_id-#{@patient_1.id}")
      expect(page).to have_css("#patient_id-#{@patient_3.id}")
    end

    within "#patient_id-#{@patient_4.id}" do
      expect(page).to have_content(@patient_4.name)
    end
    within "#patient_id-#{@patient_2.id}" do
      expect(page).to have_content(@patient_2.name)
    end
    within "#patient_id-#{@patient_5.id}" do
      expect(page).to have_content(@patient_5.name)
    end
    within "#patient_id-#{@patient_1.id}" do
      expect(page).to have_content(@patient_1.name)
    end
    within "#patient_id-#{@patient_3.id}" do
      expect(page).to have_content(@patient_3.name)
    end
  end
end