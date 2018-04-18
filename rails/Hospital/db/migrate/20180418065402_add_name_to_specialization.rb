class AddNameToSpecialization < ActiveRecord::Migration[5.2]
	def change
		add_column :specializations, :name, :string
	end
end
