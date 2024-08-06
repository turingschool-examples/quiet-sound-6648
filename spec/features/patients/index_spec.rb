require 'rails_helper'

RSpec.describe 'Patient index page', type: :feature do
  it 'shows the names of all adult patients in alphabetical order' do
    patient1 = Patient.create!(name: 'zoidberg', age: 30)
    patient2 = Patient.create!(name: 'Bender', age: 25)
    patient3 = Patient.create!(name: 'Fry', age: 17)

    visit patients_path

    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to_not have_content(patient3.name)

    within 'ul' do
      expect(page.body.index(patient2.name)).to be < page.body.index(patient1.name)
    end
  end

  it 'does not display non-adult patients' do
    patient1 = Patient.create!(name: 'Bender', age: 25)
    patient2 = Patient.create!(name: 'Fry', age: 17)

    visit patients_path

    expect(page).to have_content(patient1.name)
    expect(page).to_not have_content(patient2.name)
  end

  it 'orders patient names regardless of capitalization' do
    patient1 = Patient.create!(name: 'zoidberg', age: 30)
    patient2 = Patient.create!(name: 'bender', age: 25)

    visit patients_path

    within 'ul' do
      expect(page.body.index(patient2.name)).to be < page.body.index(patient1.name)
    end
  end
end