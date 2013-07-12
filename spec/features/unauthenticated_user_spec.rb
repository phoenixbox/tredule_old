require 'spec_helper'

describe 'as a public patient' do
	context 'when I visit the homepage' do
		it 'I can sign up to the service' do
			visit root_path
			fill_in 'patient_username', :with => 'shane'
			fill_in 'patient_email', :with => 'example@example.com'
			fill_in 'patient_phone', :with => '9179127862'
			fill_in 'patient_password', :with => 'password'
			# fill_in 'patient_password_confirmation', :with => 'password'
			click_button 'Create Patient'
			expect(page).to have_content "Account:"
		end
	end
end