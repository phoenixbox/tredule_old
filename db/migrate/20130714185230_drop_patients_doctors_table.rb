class DropPatientsDoctorsTable < ActiveRecord::Migration
  def change
    drop_table :patients_doctors
  end
end
