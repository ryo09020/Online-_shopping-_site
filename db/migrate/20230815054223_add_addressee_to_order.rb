class AddAddresseeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :addressee, :string  ,null: false
  end
end
