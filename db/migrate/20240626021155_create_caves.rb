class CreateCaves < ActiveRecord::Migration[7.0]
  def change
    create_table :cafes do |t|
      t.string      :name,          null: false
      t.string      :address,       null: false
      t.text        :image,         null: false
      t.string      :phone_number
      t.string      :opening_times
      t.string      :closing_days 
      t.integer     :prefecture_id, null: false
      t.timestamps
    end
  end
end
