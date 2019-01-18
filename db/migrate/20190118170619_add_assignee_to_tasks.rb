class AddAssigneeToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :assignee_id, :integer
  end
end
