class Doctor < ActiveRecord::Base
	authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :speciality, :password, :medical_school, :practice
  attr_reader :speciality

  has_many :healthcares
  has_many :patients, :through => :healthcares
end
