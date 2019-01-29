class RenameEmailField < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :email, :email_address
    end
  end
end
