class AddImagePathToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :image_path, :string
  end
end
