class CreateDoctorsPatients < ActiveRecord::Migration
  def change
    create_table :doctors_patients do |t|
    	t.belongs_to :doctor
      t.belongs_to :patient
      t.timestamps
    end
  end
end
