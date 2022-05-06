class Game < ApplicationRecord
  has_many :posts
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: {in : 2..100}
end
