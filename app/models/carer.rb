class Carer < ActiveRecord::Base
	attr_accessible :username, :email

	validates :username, :email, :phone, :relationship, presence: true
	validates :email, uniqueness: true

	belongs_to :patient
end