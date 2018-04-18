class ChangePhnoToBigint < ActiveRecord::Migration[5.2]
  def change
  	change_column :doctors, :ph_no, :integer, :limit =>8
  end
end
