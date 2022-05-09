class Game < ApplicationRecord
  has_many :posts, through: :users
  has_many :users
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { in: 2..500 }
end
