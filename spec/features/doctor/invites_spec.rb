require 'spec_helper'

describe 'as an authenticated patient' do
	before(:each) do
		@doctor = FactoryGirl.create(:doctor)
		@patient = FactoryGirl.create(:patient)
	end

	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => 'doctor@example.com'
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Dr.Account:"
	end

	it 'I can invite a doctor to be my doctor' do
		visit doctor_path(@doctor)
		click_link 'My Patients'
		expect(page).to have_content 'My Patients'
		expect(page).to have_content 'Invite a Patient'
		click_link 'Invite a Patient'
		expect(page).to have_field('Email')
	end
end
# save_and_open_page