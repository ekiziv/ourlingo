class Business < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: { scope: :address }
end
