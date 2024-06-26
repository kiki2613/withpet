class RenameCavesToCafeModelName < ActiveRecord::Migration[7.0]
  def change
    rename_table :caves, :cafe_model_names
  end
end
