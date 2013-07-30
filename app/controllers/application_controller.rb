class ApplicationController < ActionController::Base
  protect_from_forgery

 helper_method  :current_doctor,
                :current_patient,
                :current_carer

  def current_doctor
    @current_user ||= Doctor.find(session[:doctor_id]) if session[:doctor_id]
  end

  def current_patient
    @current_user ||= Patient.find(session[:patient_id]) if session[:patient_id]
  end

  def current_carer
    @current_user ||= Carer.find(session[:carer_id]) if session[:carer_id]
  end

  def doctor(params)
    Doctor.where(email: params[:sessions][:email]).first
  end

  def patient(params)
    Patient.where(email: params[:sessions][:email]).first
  end
end
