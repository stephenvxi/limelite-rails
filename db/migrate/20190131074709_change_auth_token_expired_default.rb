class ChangeAuthTokenExpiredDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :auth_tokens, :expired, :false
  end
end
