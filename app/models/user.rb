class User < ApplicationRecord
  has_many: games
  has_many: posts
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {in: 3..15}
end
