class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.float :total

      t.timestamps
    end
  end
end
