class CreateProductsCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :products_carts do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :paroduct, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
