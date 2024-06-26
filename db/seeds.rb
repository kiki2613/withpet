shops = [
  {
    name: 'cafe STUDIO',
    address: '東京都渋谷区神宮前4-31-10 ＹＭスクエア原宿１階',
    nearest_station: '明治神宮',
    time_to_station: 1,
    phone_number: '03-3478-0182',
    opening_times: '11:30 - 21:00',
    closing_days: '無休',
    attention: 'テラス席のみ可',
    image_path: '/images/cafe STUDIO.jpg'
   
  },
  {
    name: '3rd Avenue Food Market',
    address: '神奈川県川崎市中原区小杉町3-600',
    nearest_station: 'JR武蔵小杉',
    time_to_station: 1,
    phone_number: '044-322-0850',
    opening_times: '11:00 - 22:00',
    closing_days: '',
    attention: 'テラス席のみ可',
    image_path: '/images/3rd Avenue Food Market.jpg'
    
  },
  {
    name: 'コテカフェ',
    address: '千葉県千葉市若葉区高品町250-1',
    nearest_station: '東千葉',
    time_to_station: 19,
    phone_number: '043-309-5686',
    opening_times: '11:00 - 18:00',
    closing_days: '毎週水曜日',
    attention: 'テラス席のみ可',
    image_path: '/images/コテカフェ.jpg'
    
  },
  {
    name: '049DINER',
    address: '埼玉県川越市連雀町16-6',
    nearest_station: '本川越',
    time_to_station: 10,
    phone_number: '049-202-2049',
    opening_times: '10:00 - 21:00',
    closing_days: '',
    attention: '',
    image_path: '/images/049DINER.jpg'
    
  },
  {
    name: 'マーサーカフェダンロ',
    address: '東京都渋谷区恵比寿南1-16-12 ABCMAMIES 2F',
    nearest_station: '恵比寿',
    time_to_station: 3,
    phone_number: '03-3791-3551',
    opening_times: '17:00 - 23:00',
    closing_days: '無休',
    attention: '',
    image_path: '/images/マーサーカフェダンロ.jpg'
    
  }
]

shops.each do |shop|
  Shop.create!(shop)
end