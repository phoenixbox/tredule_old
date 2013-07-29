class CreateCarersTable < ActiveRecord::Migration
  def change
  	create_table :carers do |t|
  		t.string :username, 				:null => false
  		t.string :email, 						:default => nil
  		t.string :relationship, 		:default => nil
  		t.string :phone, 						:default => nil
  		t.string :crypted_password, :default => nil
  		t.string :salt,						 	:default => nil
  		t.belongs_to :patient,			:default => nil
  	end
  end
end
