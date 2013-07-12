require 'spec_helper'

describe 'as an authenticated user' do
	before(:each) do
		@patient = FactoryGirl.create(:patient)
	end
	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => @patient.email
			fill_in 'sessions_password', :with => @patient.password
			click_button 'Sign-in'
		}
		expect(page).to have_content("Account:<%= @patient.username %>")
	end
end