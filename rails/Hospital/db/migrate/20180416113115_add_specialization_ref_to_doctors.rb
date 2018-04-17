class AddSpecializationRefToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :specialization, foreign_key: true
  end
end
