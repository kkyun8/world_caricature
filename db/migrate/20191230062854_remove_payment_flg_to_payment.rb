class RemovePaymentFlgToPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :payment_flg, :integer
    remove_column :payments, :payment_options, :string
  end
end
