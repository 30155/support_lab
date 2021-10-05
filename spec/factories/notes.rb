FactoryBot.define do
  factory :note do
    word      { '単体テスト' }
    word_kana { 'たんたいてすと' }
    summary   { Faker::Lorem.sentence }
    text      { Faker::Lorem.sentences }
    reference { Faker::Book.title }

    association :user
  end
end
