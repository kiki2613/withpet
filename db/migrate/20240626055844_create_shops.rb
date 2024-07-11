class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string      :name,            null: false
      t.string      :address,         null: false
      t.string      :nearest_station, null: false
      t.integer     :time_to_station
      t.string      :phone_number
      t.string      :opening_times_daytimes
      t.string      :opening_times_night
      t.string      :closing_days
      t.string      :boudget_daytimes
      t.string      :boudget_night
      t.string      :genre
      t.text        :attention
      t.timestamps
    end
  end
end
