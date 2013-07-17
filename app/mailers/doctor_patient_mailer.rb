class DoctorPatientMailer < ActionMailer::Base
  default from: "invite@tredule.com"

  def invite_patient(doctor, patient)
    @doctor = doctor
    @patient = patient
    mail to: patient[:email], subject: 'Invite to be ' + doctor.username.capitalize + '\'s patient on Tredule'
  end
end
