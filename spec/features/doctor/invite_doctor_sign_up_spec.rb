require 'spec_helper'

describe 'as a public doctor invited by a patient to signup' do
	let(:patient) {FactoryGirl.create(:patient)}
	let(:doctor) {FactoryGirl.build(:doctor)}

	it 'I can see the sign-up form' do
		visit patients_new_doctor_path(patient, "example@example.com")
		expect(page).to have_selector('div#doctor-signup')
		expect(page).to have_content('Patient Name')
		within(:css, 'div#doctor-signup'){
			fill_in "username", :with => 'frank'
			fill_in "email", :with => 'example@example.com'
			fill_in "phone", :with => '56748396'
			fill_in "medical_school", :with => 'harvard'
			fill_in "practice", :with => '123 Fake Street'
			select 'Surgeon', from: 'speciality'
			fill_in "password", :with => 'password'
			click_button 'Sign-Up!'
		}
		expect(page).to have_content "frank"
		click_link 'My Patients'
		expect(page).to have_content "Shane"
		expect(page).to have_content "Logged in as:"
	end
end