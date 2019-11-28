class RemoveOrderTypesFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_types, :integer
  end
end
