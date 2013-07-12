class Patient < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :password

  # has_and_belongs_to_many :doctors
end
