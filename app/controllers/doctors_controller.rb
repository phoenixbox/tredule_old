class DoctorsController < ApplicationController
	def show
		@doctor = Doctor.find(params[:id])
	end

	def create
		doctor = Doctor.new(params[:doctor])
		if doctor.save
			redirect_to doctor_path(doctor), notice: "Account created"
		else
			redirect_to root_path
		end
	end
end