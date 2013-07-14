class Doctor < ActiveRecord::Base
	authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :speciality, :password
  attr_reader :speciality

  has_and_belongs_to_many :patients
end
