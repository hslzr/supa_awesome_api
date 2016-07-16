class AddNameAndTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :token, :string
    add_index :users, :token
  end
end
