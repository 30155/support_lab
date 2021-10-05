FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    person = Gimei.new
    name { person.first.kanji + person.last.kanji }
    affiliation { Faker::Team.name }
  end
end
