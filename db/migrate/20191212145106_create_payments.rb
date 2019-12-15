class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments , options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :order_number, null: false
      t.integer :order_id, null: false
      t.integer :sample_image_id, null: false
      t.integer :price, null: false
      t.boolean :payment_flg, default: false
      t.string :payment_options, null: false

      t.timestamps
    end
  end
end
