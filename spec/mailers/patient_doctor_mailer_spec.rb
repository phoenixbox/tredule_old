require "spec_helper"

describe PatientDoctorMailer do
  describe "invite_doctor" do
    let(:mail) { PatientDoctorMailer.invite_doctor }

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
