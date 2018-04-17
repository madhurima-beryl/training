class AddSalaryToDoctor < ActiveRecord::Migration[5.2]
  def change
  	add_column :doctors, :salary, :decimal
  end
end
