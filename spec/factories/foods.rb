FactoryBot.define do
  factory :food do
    name             { '天ぷらうどん' }
    protein          { '18' }
    fat              { '7' }
    carbohydrate     { '54' }
    calorie          { '530' }
    association :user
  end
end
