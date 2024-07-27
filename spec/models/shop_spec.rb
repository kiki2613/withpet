require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe '店舗情報の登録' do
    context '店舗情報の登録ができるとき' do
      it 'name, address, nearest_station, image_path, attentionがあるとき' do
        expect(@shop).to be_valid
      end
      it 'time_to_staionがなくても登録できる' do
        @shop.time_to_station = ''
        expect(@shop).to be_valid
      end
      it 'phone_numberがなくても登録できる' do
        @shop.phone_number = ''
        expect(@shop).to be_valid
      end
      it 'opening_times_daytimesがなくても登録できる' do
        @shop.opening_times_daytimes = ''
        expect(@shop).to be_valid
      end
      it 'opening_times_nightがなくても登録できる' do
        @shop.opening_times_night = ''
        expect(@shop).to be_valid
      end
      it 'closing_daysがなくても登録できる' do
        @shop.closing_days = ''
        expect(@shop).to be_valid
      end
      it 'genreがなくても登録できる' do
        @shop.genre = ''
        expect(@shop).to be_valid
      end
    end
    context '店舗情報の登録ができないとき' do
      it 'nameが空のとき' do
        @shop.name = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Name can't be blank")
      end
      it 'addressが空のとき' do
        @shop.address = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Address can't be blank")
      end
      it 'nearest_stationが空のとき' do
        @shop.nearest_station = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Nearest station can't be blank")
      end
      it 'image_pathが空のとき' do
        @shop.image_path = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Image path can't be blank")
      end
      it 'attentionが空のとき' do
        @shop.attention = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Attention can't be blank")
      end
    end
  end
end
