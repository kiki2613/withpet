class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :user,
            uniqueness: { message: 'has already been taken' }
end
