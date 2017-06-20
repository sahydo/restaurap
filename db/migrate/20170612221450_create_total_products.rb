class CreateTotalProducts < ActiveRecord::Migration
  def change
    create_table :total_products do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
