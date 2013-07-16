class Doctors::PatientsController < ApplicationController
	def index
		@doctor = Doctor.find(params[:id])
		@doctors_patients = @doctor.patients
	end

	def show
		@patient = Patient.find(params[:id])
	end
end