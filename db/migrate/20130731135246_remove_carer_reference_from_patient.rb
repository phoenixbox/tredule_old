class RemoveCarerReferenceFromPatient < ActiveRecord::Migration
  def change
  	remove_column :patients, :carer_id
  end
end
