class Shop < ApplicationRecord
  # include Ransack::Searchable
  # scope :by_prefecture, ->(prefecture_id) { where(prefecture_id: prefecture_id) }
  # scope :by_nearest_station, ->(station) { where("nearest_station LIKE ?", "%#{station}%")}

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # validates :prefecture_id,
  #           numericality: { other_than: 1, message: 'を選択してください' }
end
