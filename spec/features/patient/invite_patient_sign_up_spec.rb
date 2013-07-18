require 'spec_helper'

describe 'as an invited client to Tredule by a member doctor' do
	let(:doctor) {FactoryGirl.create(:doctor)}
	let(:patient) {FactoryGirl.build(:patient)}

	it 'I can see the sign-up form' do
		visit doctors_new_patient_path(doctor, "example@example.com")
		expect(page).to have_selector('div#patient-signup')
		expect(page).to have_content('Doctor Name')
		within(:css, 'div#patient-signup'){
			fill_in "username", :with => 'shane'
			fill_in "email", :with => 'example@example.com'
			fill_in "phone", :with => '56748396'
			fill_in "password", :with => 'password'
			click_button 'Sign-Up!'
		}
		expect(page).to have_content "Shane"
		click_link 'My Doctors'
		expect(page).to have_content "#{doctor.username.capitalize}"
		expect(page).to have_content "Logged in as:"
	end
end