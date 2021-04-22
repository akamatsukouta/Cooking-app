class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cooking

  validates :text, presence: true
  validates :user_id, presence: true
  validates :cooking_id, presence: true
end
