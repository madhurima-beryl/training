class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :appointments, :patients_id, :patient_id
  	rename_column :appointments, :doctors_id, :doctor_id
  end
end
