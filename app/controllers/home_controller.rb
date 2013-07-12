class HomeController < ApplicationController
	def index
		@patient = Patient.new
		@doctor = Doctor.new
		# @session = Session.new
	end
end
