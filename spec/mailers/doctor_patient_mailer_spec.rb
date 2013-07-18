require "spec_helper"

describe DoctorPatientMailer do
  describe "invite_patient" do
    let(:mail) { DoctorPatientMailer.invite_patient }

    xit "renders the headers" do
      mail.subject.should eq("Invite patient")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    xit "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
