class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string      :name,            null: false
      t.string      :address,         null: false
      t.string      :nearest_station, null: false
      t.integer     :time_to_station
      t.string      :phone_number
      t.text        :opening_times
      t.string      :closing_days
      t.text        :attention
      t.timestamps
    end
  end
end
