class RemoveResetPasswordToken < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :reset_password_token
  end
end
