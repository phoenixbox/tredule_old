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

	it 'I can invite someone to be my carer' do
		visit patient_path(patient)
		click_link 'My Carers'
		expect(page).to have_content 'My Carers'
		expect(page).to have_content 'Invite a Carer'
		expect(page).to have_selector('div#invite-carer')
	end

	it 'I can see a list of my carers' do
		# TODO: Set the testing logic for viewing a carer of a patient when they are associated
	end

end