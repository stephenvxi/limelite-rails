class SetDefaultStatusToTasks < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:tasks, :status_id, 1)
  end
end
