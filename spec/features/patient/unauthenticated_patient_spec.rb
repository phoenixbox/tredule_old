require 'spec_helper'

describe 'as a public patient' do
	context 'when I visit the homepage' do
		it 'I see the sign-up form' do
			visit root_path
			expect(page).to have_css('input#patient_username')
		end

		it 'I can sign up to the service' do
			visit root_path
			fill_in 'patient_username', :with => 'shane'
			fill_in 'patient_email', :with => 'example@example.com'
			fill_in 'patient_phone', :with => '9179127862'
			fill_in 'patient_password', :with => 'password'
			click_button 'Sign-Up!'
			expect(page).to have_content "Account:"
		end
	end
end