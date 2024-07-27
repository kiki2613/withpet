class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews,   dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviewed_shops,  through: :reviews,   source: :shop
  has_many :favorited_shops, through: :favorites, source: :shop

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :gender

  validates :nickname,
            presence: true

  validates :password,
            presence: true, on: :create

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
