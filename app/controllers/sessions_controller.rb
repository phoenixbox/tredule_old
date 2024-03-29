class SessionsController < ApplicationController
  def new
  end

  def create
    doctor = doctor(params)
    patient = patient(params)
    if doctor
      session[:doctor_id] = doctor.id
      redirect_to doctor_path(doctor) and return
    elsif patient
      session[:patient_id] = patient.id
      redirect_to patient_path(patient) and return
    else
      redirect_to root_path, notice: "Log-in un-successful please retry"
    end
  end

  def destroy_doctor
    session[:doctor_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def destroy_patient
    session[:patient_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def destroy_carer
    session[:carer_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end