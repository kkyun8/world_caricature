class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :title, null: false
      t.string :contents, null: false
      t.boolean :delflg, default: false

      t.timestamps
    end
  end
end
