class Patients::InvitesController < ApplicationController
	def new
		@doctor = Doctor.new(username: params[:username], email: params[:email])
		@patient = Patient.find(params[:id])
	end

	def create
		patient = Patient.find(params[:id])
		doctor = Doctor.new(
			username: params[:username],
			email: params[:email],
			phone: params[:phone],
			speciality: params[:speciality],
			password: params[:password]
			)
		# TODO: Implement the Helathcare association creation and then reflect the collection for a doctor in the view. Wahoo!
		Healthcare.create(doctor_id: doctor.id,patient_id: patient.id)
		doctor.build()
		if doctor.save
			doctor.patients.build()

		binding.pry
		# need to catch the patient_id
	end
end