class RenameafeModelNameToCafe < ActiveRecord::Migration[7.0]
  def change
    rename_table :cafe_model_names, :cafe
  end
end
