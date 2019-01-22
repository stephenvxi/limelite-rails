class AddForeignKeysToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_by, :integer
    add_column :users, :company_id, :integer
  end
end
