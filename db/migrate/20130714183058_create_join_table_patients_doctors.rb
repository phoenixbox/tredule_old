class CreateJoinTablePatientsDoctors < ActiveRecord::Migration
	def change
		create_table :patients_doctors, id: false do |t|
			t.integer :patient_id
			t.integer :doctor_id
		end
	end
end
