class CreateCartedProducts < ActiveRecord::Migration
  def change
    create_table :carted_products do |t|
      t.string :product_id
      t.string :order_id
      t.string :quantity

      t.timestamps null: false
    end
  end
end
