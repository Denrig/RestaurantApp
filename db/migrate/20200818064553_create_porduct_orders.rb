class CreatePorductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :porduct_orders do |t|

      t.timestamps
    end
  end
end
