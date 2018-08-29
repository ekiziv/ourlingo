class Review < ApplicationRecord
  belongs_to :user

  validates :english_rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :place_id, presence: true
end
