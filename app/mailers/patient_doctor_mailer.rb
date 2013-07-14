class PatientDoctorMailer < ActionMailer::Base
  default from: "invite@tredule.com"

  def invite_doctor(patient, doctor)
    @patient = patient
    @doctor = doctor
    mail to: doctor[:email], subject: 'Invite to be ' + patient.username.capitalize + '\'s doctor on Tredule'
  end
end
