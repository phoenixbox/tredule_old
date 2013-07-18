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
			session[:doctor_id] = doctor.id
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

	def existing
		@patient = Patient.find(params[:id])
	end
	# TODO: implement session setting after association for new account creations
	def session_and_associate
		patient = Patient.find(params[:id])
		doctor = Doctor.where(email: params[:email]).first
		if associate_doctor_patient(doctor, patient)
			session[:doctor_id] = doctor.id
			redirect_to doctors_patient_path(doctor, patient), notice: 'Logged in and association made!'
		else
			redirect_to :back, notice: 'Your details may have been entered incorrectly, please try again'
		end
	end
end