class AddTaskPriorities < ActiveRecord::Migration[5.0]
  def change
    add_column :task_priorities, :name, :string
    add_column :task_priorities, :level, :integer
    add_column :tasks, :priority_id, :integer
  end
end
