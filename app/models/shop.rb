class Shop < ApplicationRecord
  has_many :favorites

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
