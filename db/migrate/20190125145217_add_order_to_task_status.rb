class AddOrderToTaskStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :task_statuses, :order, :integer
  end
end
