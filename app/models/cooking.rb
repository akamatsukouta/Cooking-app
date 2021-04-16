class Cooking < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many_attached :images

  validate :image_length

  private

  def image_length
    if images.length >= 5
      errors.add(:images, "は4枚以内にしてください")
    end
  end

end
