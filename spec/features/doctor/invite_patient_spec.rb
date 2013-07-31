require 'spec_helper'

describe 'as a member doctor' do

	let(:doctor){FactoryGirl.create(:doctor)}
	# let(:patient){FactoryGirl.create(:patient)}

	# before(:each) do
	# 	@doctor = FactoryGirl.create(:doctor)
	# 	@patient = FactoryGirl.create(:patient)
	# end

	it 'I can sign in' do
		visit root_path
		within(:css, 'div#user-sign-in'){
			expect(page).to have_content("Sign-in")
			fill_in 'sessions_email', :with => doctor.email
			fill_in 'sessions_password', :with => 'password'
			click_button 'Sign-in'
		}
		expect(page).to have_content "Dr.Account:"
	end

	it 'I can invite a client to be my patient' do
		visit doctor_path(doctor)
		click_link 'My Patients'
		expect(page).to have_content 'My Patients'
		expect(page).to have_content 'Invite a Patient'
		within(:css, 'div#invite-patient-email'){
			fill_in 'patient-username', :with => 'shane'
			fill_in 'patient-email', :with => 'rogerssh@tcd.ie'
			click_button 'Invite'
		}
		expect(page).to have_content 'Follow this link to sign-up'
	end
end
# save_and_open_page