class PatientsController < ApplicationController
	def new
		@patient = Patient.new
	end

	def create
		patient = Patient.new(params[:patient])
		if patient.save
			auto_login(patient)
			redirect_to patient_path(patient), notice: "Successfully signed in"
		else
			redirect_to root_path, notice: "Not signed up! Try again :)"
		end
	end

	def show
		@patient = Patient.find(params[:id])
		@patients_doctors = @patient.doctors
	end
end