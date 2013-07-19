class PatientCarerMailer < ActionMailer::Base
  default from: "invite@tredule.com"

  def invite_carer(patient, carer)
    @patient = patient
    @carer = carer
    mail to: carer['carer-email'], subject: 'Invite to be ' + patient.username.capitalize + '\'s carer on Tredule'
  end
end
