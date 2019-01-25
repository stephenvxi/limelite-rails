class AddStylesToTaskAttr < ActiveRecord::Migration[5.0]
  def change
    add_column :task_statuses, :style, :string
    add_column :task_priorities, :style, :string
  end
end
