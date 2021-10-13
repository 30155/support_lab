FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.images.attach(io: File.open('public/images/top-sample.jpg'), filename: 'top-sample.jpg')
    end
  end
end
