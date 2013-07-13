require 'spec_helper'

describe 'as a public doctor' do
	context 'when I visit the homepage' do
		before(:each) do
			@doctor = FactoryGirl.create(:doctor)
		end
		it 'I see the sign-up form' do
			visit root_path
			expect(page).to have_css('input#doctor_username')
		end

		it 'I can sign up to the service' do
			visit root_path
			fill_in 'doctor_username', :with => 'doctor'
			fill_in 'doctor_email', :with => 'doctor@example.com'
			fill_in 'doctor_phone', :with => '0987654234'
			select 'Surgeon', from: 'doctor_speciality'
			# fill_in 'patient_password_confirmation', :with => 'password'
			click_button 'Create Account'
			expect(page).to have_content "Dr.Account:"
		end

		# let(:doctor){FactoryGirl.create(:doctor)}

		it 'I can login' do
			visit	root_path
			fill_in '', :with => @doctor.email
			fill_in '', :with => @doctor.password
			expect(page).to have_content "Dr.Account:"
		end
	end
end