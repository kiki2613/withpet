class Shop < ApplicationRecord
  has_many :reviews,   dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviewed_by_users,  through: :reviews,   source: :user
  has_many :favorited_by_users, through: :favorites, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :name, :address, :nearest_station, :image,
            presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "nearest_station"]
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
