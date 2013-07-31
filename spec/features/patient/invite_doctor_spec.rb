require 'spec_helper'

describe 'as an authenticated patient' do

	let(:carer){FactoryGirl.create(:carer)}
	let(:patient){FactoryGirl.create(:patient)}
	let(:doctor){FactoryGirl.create(:doctor)}

	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => patient.email
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Account:"
	end

	it 'I can invite a doctor to be my doctor' do
		visit patient_path(patient)
		click_link 'My Doctors'
		expect(page).to have_content 'My Doctors'
		expect(page).to have_content 'Email:'
		within(:css, 'div#invite-doctor-email'){
			fill_in 'doctor-email', :with => 'rogerssh@tcd.ie'
			click_button 'Invite'
		}
		expect(page).to have_content 'Follow this link to sign-up'
	end
end