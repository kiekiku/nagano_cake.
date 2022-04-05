class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.integer :order_id
      t.integer :item_id
    end
  end
end
