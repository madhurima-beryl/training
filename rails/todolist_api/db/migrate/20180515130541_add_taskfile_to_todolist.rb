class AddTaskfileToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :taskfile, :string
  end
end
