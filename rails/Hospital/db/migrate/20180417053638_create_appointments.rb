class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|

  	 	t.belongs_to :patients
      t.belongs_to :doctors	
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
