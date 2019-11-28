class AddOrderTypesToSampleImages < ActiveRecord::Migration[5.2]
  def change
    add_column :sample_images, :order_type, :string, after: :name, null: false
  end
end
