class AddTableToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :table, index: true, foreign_key: true
  end
end
