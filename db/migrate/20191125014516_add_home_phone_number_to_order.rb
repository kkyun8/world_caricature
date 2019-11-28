class AddHomePhoneNumberToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :home_phone_number, :integer, after: :cell_phone_number, null: false
  end
end
