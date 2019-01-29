class RemoveDeviseFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
  end
end
