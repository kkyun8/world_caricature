class AddCellPhoneNumberToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cell_phone_number, :integer, after: :line_id, null: false
  end
end
