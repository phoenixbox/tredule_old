require 'spec_helper'

feature 'As a patient member of Tredule I can invite a carer' do
	describe 'When logged in and on the carer page' do
		before(:each) do
			patient = FactoryGirl.create(:patient)
			visit root_path
			within(:css, 'div#user-sign-in'){
				expect(page).to have_content("Sign-in")
				fill_in 'sessions_email', :with => patient.email
				fill_in 'sessions_password', :with => patient.password
				click_button 'Sign-in'
			}
			expect(page).to have_content(patient.username.capitalize)
		end

		it 'I can see the carer invite dialogue' do
			expect(page).to have_link('My Carers')
			expect(page).to have_link('Logout')
			click_link 'My Carers'
			expect(page).to have_selector('div#invite-patient-email')
			within(:css, 'div#invite-patient-email'){
				fill_in 'carer-username', :with => 'Shane'
				select 'Family', from: 'relationship'
				fill_in 'carer-email', :with => 'rogerssh@tcd.ie'
				click_button 'Invite'
			}
			expect(page).to have_content('Invite Sent!')
		end
	end
end