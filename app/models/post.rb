class Post < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :title, presence: true
  validates :text, presence: true
  validates :text, length: { in: 3..150 }
  validates :user_id, presence: true
end
