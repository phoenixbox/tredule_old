class Patients::DoctorsController < ApplicationController
	def index
		@patient = Patient.find(params[:id])
		@patients_doctors = @patient.doctors
	end

	def show
		@patient_doctor = Doctor.find(params[:id])
	end

	def invite_doctor
		patient = Patient.find(params[:id])
		doctor = {username: params["doctor-username"], email: params["doctor-email"]}
		PatientDoctorMailer.invite_doctor(patient, doctor).deliver
		redirect_to :back, notice: 'Invite sent!'
	end

	def create
		binding.pry
	end
end