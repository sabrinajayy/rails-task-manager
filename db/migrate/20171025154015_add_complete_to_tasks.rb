class AddCompleteToTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :completed, :boolean, :default => false
  end
end
