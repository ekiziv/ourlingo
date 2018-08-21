class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business

  validates :description, presence: true
  validates :english_rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
