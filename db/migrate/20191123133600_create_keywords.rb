class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.integer :data_type_id, null: false
      t.string :value, null: false
      t.boolean :delflg, default: false

      t.timestamps
    end
  end
end
