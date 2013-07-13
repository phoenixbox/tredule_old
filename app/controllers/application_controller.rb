class ApplicationController < ActionController::Base
  protect_from_forgery
  # def current_user
  # 	if Doctor.find(session[:doctor_id])
  # 		doctor
  # 	else
  # 		Patient.find(session[:patient_id])
  # 	end
  # end

  def doctor(params)
    Doctor.where(email: params[:sessions][:email]).first
  end

  def patient(params)
    Patient.where(email: params[:sessions][:email]).first
  end
end
