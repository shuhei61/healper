FactoryBot.define do
  factory :calendar do    
    date            { '2023-01-01' }
    association :user
  end
end
