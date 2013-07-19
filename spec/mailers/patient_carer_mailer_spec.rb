require "spec_helper"

describe PatientCarerMailer do
  describe "invite_carer" do
    let(:mail) { PatientCarerMailer.invite_carer }

    it "renders the headers" do
      mail.subject.should eq("Invite carer")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
