class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :orderdate, null: false
      t.integer :pinwaiter, null: false
      t.integer :pinchef 
      t.datetime :attenddate, null: false
      t.integer :payvalue, null: false
      t.integer :status

      t.timestamps null: false
    end
  end
end
