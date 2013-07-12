class HomeController < ApplicationController
	def index
		@patient = Patient.new
		@doctor = Doctor.new
	end
end
