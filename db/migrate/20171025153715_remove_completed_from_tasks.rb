class RemoveCompletedFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :completed, :boolean
  end
end
