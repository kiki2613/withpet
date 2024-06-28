class Shop < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
