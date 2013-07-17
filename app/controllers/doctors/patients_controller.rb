class Doctors::PatientsController < ApplicationController
	def index
		@doctor = Doctor.find(params[:id])
		@doctors_patients = @doctor.patients
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def invite_patient
		doctor = Doctor.find(params[:id])
		patient = {username: params["patient-username"], email: params["patient-email"]}
		DoctorPatientMailer.invite_patient(doctor, patient).deliver
		redirect_to :back, notice: 'Invite sent!'
	end
end