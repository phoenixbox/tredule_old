class Carer < ActiveRecord::Base
	attr_accessible :username, :email, :phone, :relationship, :password, :patient_id

	belongs_to :patient

	authenticates_with_sorcery!

	validates :username, :email, :phone, :relationship, presence: true
	validates :email, uniqueness: true
end