class CreateAuthTokensStorage < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens do |t|
      t.string :uuid
      t.integer :user_id
      t.boolean :expired
      t.timestamps
    end
  end
end
