class DropTableDoctorsPatients < ActiveRecord::Migration
  def change
  	drop_table :doctors_patients
  end
end
