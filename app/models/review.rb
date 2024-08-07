class Review < ApplicationRecord
  belongs_to       :user
  belongs_to       :shop
  has_one_attached :image

  validates :visit_date, :comment,
            presence: true
end
