FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { Faker::Internet.email }
    password              { 'one111' }
    password_confirmation { password }
    gender_id             { '2' }
    age                   { '30' }
    height                { '175' }
    weight                { '65' }
    level_id              { '3' }
    essential_cal         { '1989' }
    fat_body              { '15' }
  end
end
