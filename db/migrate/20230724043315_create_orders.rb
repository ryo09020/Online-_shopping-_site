class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,null:false
      t.string :postal_number,null:false
      t.string :address,null:false
      t.string :adressee,null:false
      t.integer :postage,null:false
      t.integer :charge,null:false
      t.integer :payment_method,null:false
      t.integer :status,null:false

      t.timestamps
    end
  end
end
