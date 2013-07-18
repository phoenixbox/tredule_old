require 'spec_helper'

feature 'Patient has invited their doctor to Tredule' do
	describe 'I am a member doctor' do
		let(:patient){FactoryGirl.create(:patient)}
		let(:doctor){FactoryGirl.create(:doctor)}

		it 'I can sign in through the email invite' do
			visit patients_existing_doctor_path(patient.id, 'example@example.com')
			expect(page).to have_content("When you sign in you will connect to your patient #{patient.username.capitalize}")
			expect(page).to have_selector('div#doctor-signin')
			expect(page).to have_content('Patient Name')
			within(:css, 'form#signin'){
				fill_in 'email', with: doctor.email
				fill_in 'password', with: 'password'
				click_button 'Sign-in!'
			}
			expect(page).to have_content(patient.username.capitalize)
		end
	end
end