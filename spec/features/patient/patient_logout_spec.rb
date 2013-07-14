require 'spec_helper'

describe 'as an authenticated logged in patient' do
	before(:each) do
		@patient = FactoryGirl.create(:patient)
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => @patient.email
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Account:"
	end

	it 'I can log out' do
		visit patient_path(@patient)
		expect(page).to have_link "Logout"
		click_link "Logout"
		expect(page).to have_content "Manage your treatment with the help of those who care"
	end
end