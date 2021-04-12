class CookingExperience < ActiveHash::Base
  self.data = [
   { id: 1, cooking_experience: '---' },
   { id: 2, cooking_experience: 'あり' },
   { id: 3, cooking_experience: 'なし' }
  ]
  include ActiveHash::Associations
  has_many :users

  end 