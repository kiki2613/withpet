class Shop < ApplicationRecord
  has_many :reviews,   dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviewed_by_users,  through: :reviews,   source: :user
  has_many :favorited_by_users, through: :favorites, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :name, :address, :nearest_station, :image_path,
            presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[address nearest_station boudget_daytimes boudget_night attention]
  end

  scope :open, -> { where(attention: 'テラス席のみ可') }
  scope :closed, -> { where(status: '店内のみ可') }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
