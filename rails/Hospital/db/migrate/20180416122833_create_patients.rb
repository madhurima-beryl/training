class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :d_o_b
      t.string :gender
      t.integer :ph_no, :limit =>8

      t.timestamps
    end
  end
end
