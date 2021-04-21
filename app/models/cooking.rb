class Cooking < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images

  def self.search(search)
     if search != ""
       Cooking.where('cooking_name LIKE(?)', "%#{search}%")
     else
       Cooking.all
     end
  end

end
