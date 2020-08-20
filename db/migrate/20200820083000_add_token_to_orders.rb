class AddTokenToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :one_time_token, :string
  end
end
