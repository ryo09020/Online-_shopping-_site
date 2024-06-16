class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,null:false
      t.string :address,null:false
      t.string :ad_number,null:false
      t.string :addressee,null:false

      t.timestamps
    end
  end
end
