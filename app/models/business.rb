class Business < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: { scope: :address }

  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
