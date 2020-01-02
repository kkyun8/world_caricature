class ChangeDatatypeSquareCreatedAtOfPayments < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :square_created_at, :datetime
  end
end
