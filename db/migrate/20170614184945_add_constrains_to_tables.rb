class AddConstrainsToTables < ActiveRecord::Migration
  def change
    change_column :ingredients, :name, :string, null: false
    change_column :products, :name, :string, null: false
    change_column :products, :price, :integer, null: false
    change_column :total_products, :product_id, :integer, null: false
    change_column :total_products, :ingredient_id, :integer, null: false
    change_column :type_products, :name, :string, null: false
  end
end
