class SessionsController < ApplicationController
  def new
  end

  def create
    doctor = doctor(params)
    patient = patient(params)
    binding.pry
    if doctor
      redirect_to doctor_path(doctor) and return
    elsif patient
      redirect_to patient_path(patient) and return
    else
      redirect_to root_path, notice: "Log-in un-successful please retry"
    end
  end

  def doctor(params)
    Doctor.where(email: params[:sessions][:email]).first
  end

  def patient(params)
    Patient.where(email: params[:sessions][:email]).first
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end