class Doctor < ActiveRecord::Base
	authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :speciality, :password
end
