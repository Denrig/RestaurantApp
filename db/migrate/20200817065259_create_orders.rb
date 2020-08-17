class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :city
      t.text :address

      t.string :phone
      t.text :products
      t.belongs_to :user,index: true

      t.timestamps
    end
  end
end
