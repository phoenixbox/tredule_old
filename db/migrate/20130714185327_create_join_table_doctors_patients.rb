class CreateJoinTableDoctorsPatients < ActiveRecord::Migration
	def change
		create_table :doctors_patients, id: false do |t|
			t.integer :doctor_id
			t.integer :patient_id
		end
	end
end