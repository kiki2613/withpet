class Shop < ApplicationRecord
  has_many :favorites
  has_many :favorited_by_users, through: :favorites, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
