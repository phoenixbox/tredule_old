require 'spec_helper'

feature 'As a person who has received an email invite to be a carer' do
	describe 'I can follow the url' do
		let(:patient){FactoryGirl.create(:patient)}

		it 'and sign up to Tredule to be a patients carer and see this relationship' do
			visit patients_new_carer_path(patient, 'carer@carer.com')
			expect(page).to have_selector('div#carer-signup')
			expect(page).to have_content('Patient Name')
			within(:css, 'div#carer-signup'){
				fill_in "username", :with => 'carer'
				fill_in "email", :with => 'example@example.com'
				select "Family", :from => 'relationship'
				fill_in "phone", :with => '56748396'
				fill_in "password", :with => 'password'
				click_button 'Sign-Up!'
			}
			expect(page).to have_content('Carer')
			expect(page).to have_link('My Patients')
			click_link 'My Patients'
			expect(page).to have_content(patient.username.capitalize)
		end
	end
end