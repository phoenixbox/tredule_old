class Patients::CarersController < ApplicationController
	def index
		@patient = Patient.find(params[:id])
		# binding.pry
		@patients_carers = Carer.where(patient_id: @patient.id)
	end

	def new
		@carer = Carer.new(username: params[:username], email: params[:email])
		@patient = Patient.find(params[:id])
	end

	def invite_carer
		patient = Patient.find(params[:id])
		carer = {'carer-username' => params["carer-username"], 'carer-relationship'=> params['carer-relationship'], 'carer-email'=> params["carer-email"]}

		PatientCarerMailer.invite_carer(patient, carer).deliver
		redirect_to :back, notice: 'Invite sent!'
	end
end