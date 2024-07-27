FactoryBot.define do
  factory :shop do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    nearest_station { "#{Faker::Address.city}駅" }
    image_path do
      images = ['shop_image1.jpg', 'shop_image2.jpg', 'shop_image3.jpg', 'shop_image4.jpg', 'shop_image5.jpg', 'shop_image6.jpg',
                'shop_image7.jpg', 'shop_image8.jpg', 'shop_image9.jpg', 'shop_image10.jpg']
      "/public/images/#{images.sample}"
    end
    time_to_station { Faker::Number.between(from: 1, to: 60) }
    phone_number { Faker::PhoneNumber.phone_number }
    opening_times_daytimes { "#{Faker::Number.between(from: 6, to: 12)}:00-#{Faker::Number.between(from: 13, to: 17)}:00" }
    opening_times_night { "#{Faker::Number.between(from: 17, to: 20)}:00-#{Faker::Number.between(from: 21, to: 23)}:00" }
    closing_days { %w[Sundays Mondays Tuesdays].sample }
    boudget_daytimes { "#{Faker::Number.between(from: 500, to: 1500)}-#{Faker::Number.between(from: 1500, to: 3000)} yen" }
    boudget_night { "#{Faker::Number.between(from: 2000, to: 4000)}-#{Faker::Number.between(from: 4000, to: 8000)} yen" }
    genre { ['ステーキ', '和食', '居酒屋', 'イタリアン', 'フレンチ', 'スペイン料理', 'メキシコ料理', '韓国料理', 'タイ料理', 'アジア・エスニック', 'ファストフード'].sample }
    attention { %W[\u30C6\u30E9\u30B9\u5E2D\u306E\u307F\u53EF \u5E97\u5185\u306E\u307F\u53EF \u4E21\u65B9\u53EF].sample }
  end
end
