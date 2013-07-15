class DropDoctorPatientJoin < ActiveRecord::Migration
 def change
    drop_table :doctors_patients
  end
end
