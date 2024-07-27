FactoryBot.define do
  factory :shop do
    name                   { Faker::Company.name }
    address                { Faker::Address.full_address }
    nearest_station        { "#{Faker::Address.city}駅" }
    image_path             { '/public/images/shop_image_test.jpg' }
    time_to_station        { Faker::Number.between(from: 1, to: 60) }
    phone_number           { Faker::PhoneNumber.phone_number }
    opening_times_daytimes { "#{Faker::Number.between(from: 6, to: 12)}:00-#{Faker::Number.between(from: 13, to: 17)}:00" }
    opening_times_night    { "#{Faker::Number.between(from: 17, to: 20)}:00-#{Faker::Number.between(from: 21, to: 23)}:00" }
    closing_days           { %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].sample }
    attention              { Faker::Lorem.sentence }
    genre do
      ['ステーキ', '和食', '居酒屋', 'イタリアン', 'フレンチ', 'スペイン料理', 'メキシコ料理', '韓国料理', 'タイ料理', 'アジア・エスニック', 'ファストフード'].sample
    end
  end
end
