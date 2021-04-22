FactoryBot.define do
  factory :user do
    nickname              {'ak87'}
    email                 {Faker::Internet.free_email}
    sex                   {'男性'}
    cooking_experience    {'あり'}
    password              {'asd678'}
    password_confirmation {password}
  end
end