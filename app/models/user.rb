class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age

  validates :nickname, :gender, 
            presence: true
            
  validates :age_id,
            numericality: { other_than: 1, message: 'を選択してください' }

  validates :password,
            presence: true, on: :create
end
