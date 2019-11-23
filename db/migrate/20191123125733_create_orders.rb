class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.integer :sample_image_id, null: false
      t.string :order_number, null: false
      t.integer :order_status, default: 1
      t.string :flame_size, default: 'M'
      t.boolean :premium_wrapping, default: false
      t.integer :price, null: false
      t.string :name_kanji, null: false
      t.string :name_furigana, null: false
      t.string :email
      t.string :line_id
      t.integer :postal_code, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :comment

      t.timestamps
    end
  end
end
