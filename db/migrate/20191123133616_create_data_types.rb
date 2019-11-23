class CreateDataTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :data_types, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :type_name, null: false
      t.boolean :delflg, default: false

      t.timestamps
    end
  end
end
