FactoryBot.define do
  factory :user do
    nickname              {'test1'}
    email                 {Faker::Internet.free_email}
    sex_id                {2}
    cooking_experience_id {3}
    password              {'asd123'}
    password_confirmation {password}
  end
end