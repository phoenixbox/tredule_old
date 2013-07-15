class Patient < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :password

  has_many :healthcares
  has_many :doctors, :through => :healthcares
end
