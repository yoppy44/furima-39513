FactoryBot.define do
  factory :user do
    name                  {Faker::Internet.name}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'佐藤'} 
    last_name             {'太郎'}
    first_name_kana       {'サトウ'}
    last_name_kana        {'タロウ'}
    birthday              {19300101} 
  end
end