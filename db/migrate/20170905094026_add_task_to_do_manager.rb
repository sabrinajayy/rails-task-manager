class AddTaskToDoManager < ActiveRecord::Migration[5.0]
  def change
    add_column :to_do_managers, :task, :string
  end
end
