class CarersController < ApplicationController
	def show
		@carer = Carer.find(params[:id])
		@patient = Patient.find(@carer.patient_id)
	end
end