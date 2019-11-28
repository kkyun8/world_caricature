class ChangeDatatypeHomePhoneNumberOfOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :home_phone_number, :string
  end
end
