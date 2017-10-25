class RemoveCompletetoFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :completeto, :boolean
  end
end
