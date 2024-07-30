require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @shop = FactoryBot.build(:shop)
    @favorite = FactoryBot.build(:favorite, user: @user, shop: @shop)
  end

  describe '' do
    context 'お気に入り登録できるとき' do
      it 'user_id、shop_idがあるとき' do
        expect(@favorite).to be_valid
      end
    end

    context 'お気に入り登録できないとき' do
      it 'userと紐づいていないとき' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include('User must exist')
      end

      it 'shopと紐づいていないとき' do
        @favorite.shop = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include('Shop must exist')
      end

      it 'すでにその店舗がお気に入り登録されているとき' do
        @favorite.save
        duplicate_favorite = FactoryBot.build(:favorite, user: @user, shop: @shop)
        duplicate_favorite.valid?
        expect(duplicate_favorite.errors.full_messages).to include('User has already been taken')
      end
    end
  end
end
