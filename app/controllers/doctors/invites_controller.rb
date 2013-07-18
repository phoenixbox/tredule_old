class Doctors::InvitesController < ApplicationController
	def new
		@patient = Patient.new(username: params[:username], email: params[:email])
		@doctor = Doctor.find(params[:id])
	end

	def create
		doctor = Doctor.find(params[:id])
		patient = build_patient(params)
		if patient.save
			associate_patient_doctor(patient, doctor)
			session[:doctor_id] = doctor.id
			redirect_to patient_path(patient), notice: "Account Created!"
		else
			redirect_to :back, notice: "Account not created, please try again!"
		end
	end

	def build_patient(params)
		Patient.new(
			username: params[:username],
			email: params[:email],
			phone: params[:phone],
			password: params[:password]
			)
	end

	def associate_patient_doctor(patient, doctor)
		Healthcare.create(patient_id: patient.id, doctor_id: doctor.id)
	end

	def existing
		@doctor = Doctor.find(params[:id])
	end

	def session_and_associate
		doctor = Doctor.find(params[:id])
		patient = Patient.where(email: params[:email]).first
		if associate_doctor_patient(doctor, patient)
			session[:patient_id] = patient.id
			redirect_to patients_doctor_path(patient, doctor), notice: 'Logged in and association made!'
		else
			redirect_to :back, notice: 'Your details may have been entered incorrectly, please try again'
		end
	end


end