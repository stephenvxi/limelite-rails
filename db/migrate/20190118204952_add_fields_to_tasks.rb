class AddFieldsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :status_id, :integer
    add_column :tasks, :due_date, :date
    add_column :tasks, :started_at, :datetime
    add_column :tasks, :finished_at, :datetime
  end
end
