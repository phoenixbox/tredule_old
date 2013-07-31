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
			redirect_to doctor_path(doctor), notice: account_success
		else
			redirect_to :back, notice: account_error
		end
	end

	def create_carer
		patient = Patient.find(params[:id])
		carer = build_carer(params, patient.id)
		if carer.save
			patient.carers << carer
			login_carer(carer.id)
			redirect_to carer_path(carer), notice: account_success
		else
			redirect_to :back, notice: account_error
		end
	end

	def login_carer(carer_id)
		session[:carer_id] = carer_id
	end

	def account_error
		"Account not created, please try again!"
	end

	def account_success
		"Account Created!"
	end

	def build_carer(params, patient_id)
		# set the carer to patient association
		Carer.new(
			username: params[:username],
			email: params[:email],
			relationship: params[:relationship],
			phone: params[:phone],
			password: params[:password],
			patient_id: patient_id
			)
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

	# Associate without new Patient/Doctor record creation
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