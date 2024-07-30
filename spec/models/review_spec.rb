require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '' do
    context 'レビューが投稿できるとき' do
      it 'visit_date、commentがあるとき' do
        expect(@review).to be_valid
      end

      it 'imageがなくても保存できる' do
        @review.image = nil
        expect(@review).to be_valid
      end
    end

    context 'レビュー投稿できないとき' do
      it 'visit_dateが空のとき' do
        @review.visit_date = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Visit date can't be blank")
      end

      it 'commentが空のとき' do
        @review.comment = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Comment can't be blank")
      end

      it 'userと紐づいていないとき' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end

      it 'shopと紐づいていないとき' do
        @review.shop = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Shop must exist')
      end
    end
  end
end
