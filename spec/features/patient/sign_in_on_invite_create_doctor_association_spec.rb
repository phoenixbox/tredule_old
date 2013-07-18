require 'spec_helper'
feature 'Doctor has invited their patient, whom is already a member, to Tredule' do
	describe 'I am a member doctor' do
		let(:doctor){FactoryGirl.create(:doctor)}
		let(:patient){FactoryGirl.create(:patient)}

		it 'I can sign in through the email invite' do
			visit doctors_existing_patient_path(doctor.id, patient.email)
			expect(page).to have_content("When you sign in you will connect to your doctor")
			expect(page).to have_selector('div#patient-signin')
			expect(page).to have_content('Doctor Name')
			within(:css, 'form#signin'){
				fill_in 'email', with: patient.email
				fill_in 'password', with: 'password'
				click_button 'Sign-in!'
			}
			expect(page).to have_content(doctor.username.capitalize)
		end
	end
end