require "spec_helper"

describe PatientDoctorMailer do
  describe "invite_doctor" do
    let(:patient) {FactoryGirl.create(:patient)}
    let(:doctor) {FactoryGirl.create(:doctor)}
    let(:mail) { PatientDoctorMailer.invite_doctor(patient, doctor) }

    xit "renders the headers" do
      mail.subject.should eq("Invite doctor")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    xit "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
# feature 'Emailer' do
#   background do
#     # will clear the message queue
#     clear_emails
#     visit email_trigger_path
#     # Will find an email sent to test@example.com
#     # and set `current_email`
#     open_email('test@example.com')
#   end

#   scenario 'following a link' do
#     current_email.click_link 'your profile'
#     page.should have_content 'Profile page'
#   end

#   scenario 'testing for content' do
#     current_email.should have_content 'Hello Joe!'
#   end

#   scenario 'view the email body in your browser' do
#     # the `launchy` gem is required
#     current_email.save_and_open
#   end
# end