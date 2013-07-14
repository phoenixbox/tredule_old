require 'spec_helper'

describe 'as an authenticated logged in doctor' do
	before(:each) do
		@doctor = FactoryGirl.create(:doctor)
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => @doctor.email
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Dr.Account:"
	end

	it 'I can log out' do
		visit doctor_path(@doctor)
		expect(page).to have_link "Logout"
		click_link "Logout"
		expect(page).to have_content "Manage your treatment with the help of those who care"
	end
end