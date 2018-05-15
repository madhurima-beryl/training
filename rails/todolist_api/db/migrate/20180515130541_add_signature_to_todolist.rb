class AddSignatureToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :signature, :string
  end
end
