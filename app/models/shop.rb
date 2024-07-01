class Shop < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  has_many :favorites
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
