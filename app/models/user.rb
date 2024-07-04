class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
end
