class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :patients, foreign_key: true
      t.references :doctors, foreign_key: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
