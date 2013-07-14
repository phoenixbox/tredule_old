require 'spec_helper'

describe 'as an authenticated user' do
	before(:each) do
		@doctor = FactoryGirl.create(:doctor)
	end

	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => @doctor.email
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Dr.Account:"
	end
end