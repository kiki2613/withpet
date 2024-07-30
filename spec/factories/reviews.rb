FactoryBot.define do
  factory :review do
    visit_date  { Faker::Date.backward(days: 365) }
    comment     { Faker::Lorem.paragraph }
    association :user
    association :shop

    after(:build) do |review|
      review.image.attach(io: File.open('public/images/shop_image_test.jpg'), filename: 'shop_image_test.jpg')
    end
  end
end
