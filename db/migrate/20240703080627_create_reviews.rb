class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.date       :visit_date, null: false
      t.text       :comment,    null: false
      t.references :user,       null: false, foreign_key: true
      t.references :shop,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
