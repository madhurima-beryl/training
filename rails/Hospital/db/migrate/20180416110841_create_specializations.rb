class CreateSpecializations < ActiveRecord::Migration[5.2]
  def change
    create_table :specializations do |t|
    	t.string :name
    	
      t.timestamps
    end
  end
end
