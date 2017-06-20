class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :username, unique: true
    add_index :users, :pin, unique: true
  end
end
