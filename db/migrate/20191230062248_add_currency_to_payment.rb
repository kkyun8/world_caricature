class AddCurrencyToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :currency, :string, after: :payment_options
    add_column :payments, :source_type, :string, after: :currency
    add_column :payments, :card_brand, :string, after: :source_type
    add_column :payments, :last_4, :string, after: :card_brand
    add_column :payments, :square_created_at, :date, after: :last_4
    add_column :payments, :square_id, :string, after: :square_created_at
    add_column :payments, :square_order_id, :string, after: :square_id
    add_column :payments, :receipt_number, :string, after: :square_order_id
    add_column :payments, :receipt_url, :string, after: :receipt_number
  end
end
