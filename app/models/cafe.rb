class Cafe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id,
            numericality: { other_than: 1, message: 'を選択してください' }
end
