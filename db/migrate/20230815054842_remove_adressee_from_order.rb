class RemoveAdresseeFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :adressee, :string
  end
end
