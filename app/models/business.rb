class Business < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: { scope: :address }

  has_many :reviews, dependent: :destroy
end
