class CreateCaterorizedProducts < ActiveRecord::Migration
  def change
    create_table :caterorized_products do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps null: true
    end
  end
end
