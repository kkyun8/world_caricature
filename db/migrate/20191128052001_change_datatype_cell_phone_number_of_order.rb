class ChangeDatatypeCellPhoneNumberOfOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :cell_phone_number, :string
  end
end
