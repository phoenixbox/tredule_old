class Patient < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :email, :phone, :password
end
