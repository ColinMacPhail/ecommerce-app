class Description < ActiveRecord::Migration
  def change
    change_column :products, :price, 'numeric USING CAST(price AS numeric(7,2))'
  end
end
