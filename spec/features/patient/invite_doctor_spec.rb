require 'spec_helper'

describe 'as an authenticated patient' do
	before(:each) do
		@patient = FactoryGirl.create(:patient)
		@doctor = FactoryGirl.create(:doctor)
	end

	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => 'example@example.com'
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Account:"
	end

	it 'I can invite a doctor to be my doctor' do
		visit patient_path(@patient)
		click_link 'My Doctors'
		expect(page).to have_content 'My Doctors'
		expect(page).to have_content 'Email:'
		within(:css, 'div#invite-doctor-email'){
			fill_in 'doctor-email', :with => 'rogerssh@tcd.ie'
			click_button 'Invite'
		}
		expect(page).to have_content 'Follow this link to sign-up'
	end

	xit 'I can invite someone to be my carer' do
		visit patient_path(@patient)
		click_link 'My Carers'
		expect(page).to have_content 'My Carers'
		expect(page).to have_content 'Invite a Carer'
		click_link 'Invite a Carer'
		expect(page).to have_field('Email')
	end

end