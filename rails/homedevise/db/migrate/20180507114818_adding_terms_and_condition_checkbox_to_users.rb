class AddingTermsAndConditionCheckboxToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :t_o_c, :boolean#, default: false
  end
end
