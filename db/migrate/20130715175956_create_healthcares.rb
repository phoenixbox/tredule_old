class CreateHealthcares < ActiveRecord::Migration
  def change
    create_table :healthcares do |t|
			t.belongs_to :doctor
		  t.belongs_to :patient
      t.timestamps
    end
  end
end