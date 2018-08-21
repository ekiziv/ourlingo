class Business < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: { scope: :address }

  # Not sure about this line of code. Please, check!
  has_many :reviews, dependent: :destroy
end
