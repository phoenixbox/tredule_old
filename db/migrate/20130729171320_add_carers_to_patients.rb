class AddCarersToPatients < ActiveRecord::Migration
  def change
	  add_column :patients, :carer_id, :integer
    add_index :patients, :carer_id
  end
end
