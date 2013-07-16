class Patients::InvitesController < ApplicationController
	def new
		@doctor = Doctor.new(username: params[:username], email: params[:email])
		@patient = Patient.find(params[:id])
	end

	def create
		patient = Patient.find(params[:id])
		# TODO: either pass the doctor attributes as nested params or create external method that handles that and returns the object
		binding.pry
		doctor = build_doctor(params)
		# TODO: Implement the Helathcare association creation and then reflect the collection for a doctor in the view. Wahoo!
		if doctor.save
			associate_doctor_patient(doctor, patient)
			redirect_to doctor_path(doctor), notice: "Account Created!"
		else
			redirect_to :back, notice: "Account not created, please try again!"
		end
		# need to catch the patient_id
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