class CreateSampleImages < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_images, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :number_of_people, default: 1
      t.string :information, null: false
      t.string :image_url, null: false
      t.boolean :delflg, default: false

      t.timestamps
    end
  end
end
