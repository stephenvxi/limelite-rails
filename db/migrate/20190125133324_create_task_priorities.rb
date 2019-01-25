class CreateTaskPriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :task_priorities do |t|

      t.timestamps
    end
  end
end
