class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :phone_number, :category, presence: true
  validates_inclusion_of :category, :in => ["chinese", "italian", "japanese", "french", "belgian"]
end
