class Patients::InvitesController < ApplicationController
	def new
		@doctor = Doctor.new(username: params[:username], email: params[:email])
		@patient = Patient.find(params[:id])
	end

	def create
		patient = Patient.find(params[:id])
		doctor = build_doctor(params)
		if doctor.save
			associate_doctor_patient(doctor, patient)
			redirect_to doctor_path(doctor), notice: "Account Created!"
		else
			redirect_to :back, notice: "Account not created, please try again!"
		end
	end

	def build_doctor(params)
		Doctor.new(
			username: params[:username],
			email: params[:email],
			phone: params[:phone],
			medical_school: params[:medical_school],
			practice: params[:practice],
			speciality: params[:speciality],
			password: params[:password]
			)
	end

	def associate_doctor_patient(doctor, patient)
		Healthcare.create(doctor_id: doctor.id,patient_id: patient.id)
	end
end