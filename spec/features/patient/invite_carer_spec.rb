require 'spec_helper'

feature 'As a patient member of Tredule I can invite a carer' do
	describe 'When logged in and on the Patient>Carer page' do
		let(:carer){FactoryGirl.create(:carer)}
		let(:patient){FactoryGirl.create(:patient)}

		before(:each) do
			visit root_path
			within(:css, 'div#user-sign-in'){
				expect(page).to have_content("Sign-in")
				fill_in 'sessions_email', :with => patient.email
				fill_in 'sessions_password', :with => patient.password
				click_button 'Sign-in'
			}
			expect(page).to have_content(patient.username.capitalize)
		end

		it 'I can see the carer invite dialogue and invite them' do
			expect(page).to have_link('My Carers')
			expect(page).to have_link('Logout')
			click_link 'My Carers'
			expect(page).to have_selector('div#invite-carer')
			within(:css, 'div#invite-carer'){
				fill_in 'carer-username', :with => 'Shane'
				select 'Family', from: 'carer-relationship'
				fill_in 'carer-email', :with => 'rogerssh@tcd.ie'
				click_button 'Invite'
			}
			expect(page).to have_content('leading to happier, healthier loved ones')
		end

		it 'I can see a list of my associated carers' do
			# TODO: Set the testing logic for viewing a carer of a patient when they are associated
			p = Patient.find(carer.patient_id)
			visit patients_carers_path(p)
			expect(page).to have_content('My Carers')
			expect(page).to have_selector('div#my-carers')
			within(:css, 'div#my-carers'){
				expect(page).to have_content(p.carers.first.username.capitalize)
			}
		end

		it 'I can click through to one of my associated carers and see their details' do
			p = Patient.find(carer.patient_id)
			visit patients_carers_path(p)
			expect(page).to have_content('My Carers')
			expect(page).to have_selector('div#my-carers')
			within(:css, 'div#my-carers'){
				expect(page).to have_link(carer.username.capitalize)
			}
			click_link('Carer')
			expect(page).to have_selector('div#carer-details')
			expect(page).to have_content(carer.username)
			expect(page).to have_content(carer.email)
			expect(page).to have_content(carer.phone)
			expect(page).to have_content(carer.relationship)
		end
	end
end