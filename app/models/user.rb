class User < ApplicationRecord
  has_many :games, through: :posts
  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: {in: 3..15}
end
