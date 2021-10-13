FactoryBot.define do
  factory :schedule do
    priority { 'Normal' }
    datetime { '2021-10-10 20:20:20' }
    plan     { Faker::Lorem.word }
    memo     { Faker::Lorem.sentences }

    association :user
  end
end
