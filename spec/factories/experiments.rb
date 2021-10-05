FactoryBot.define do
  factory :experiment do
    datetime      { '2021-10-10 20:20:20' }
    weather_id    { Faker::Number.between(from: 1, to: 13) }
    temperature   { Faker::Number.decimal(l_digits: 2) }
    humidity      { Faker::Number.decimal(l_digits: 2) }
    person = Gimei.new
    member        { person.first.kanji + person.last.kanji }
    title         { Faker::Lorem.sentence }
    purpose       { Faker::Lorem.sentences }
    experimental_method { Faker::Lorem.sentences }
    condition1    { Faker::Lorem.words }
    condition2    { Faker::Lorem.words }
    result        { Faker::Lorem.sentences }
    consideration { Faker::Lorem.sentences }
    note          { Faker::Lorem.sentence }

    association :user
  end
end
