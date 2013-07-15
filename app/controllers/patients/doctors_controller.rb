class Patients::DoctorsController < ApplicationController
	def index
		@patient = Patient.find(params[:id])
	end

	def invite_doctor
		patient = Patient.find(params[:id])
		doctor = {username: params["doctor-username"], email: params["doctor-email"]}
		PatientDoctorMailer.invite_doctor(patient, doctor).deliver
		# TODO 0: Create transient doctor record to be saved upon email sign-up
		# TODO 1: Implement the email sending background worker for the invite
		# TODO 2: ERB template email so that there is an embedded link to sign-up with
		# TODO 3: Doctor record to be saved on email click thru
		# TODO 4: Doctor should then be listed in my doctors
		redirect_to :back, notice: 'Invite sent!'
	end

	def create
		binding.pry
	end
end