class Sex < ActiveHash::Base
  self.data = [
   { id: 1, sex: '---' },
   { id: 2, sex: '男性' },
   { id: 3, sex: '女性' },
   { id: 4, sex: 'それ以外' }
  ]
  include ActiveHash::Associations
  has_many :users

  end 