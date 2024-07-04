class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_shop, only: [:new, :create]

  def new
    @review = @shop.reviews.new
  end

  def create
    @review = @shop.reviews.new(review_params)
    @review.shop_id = @shop.id
    review_count = Review.where(shop_id: params[:shop_id]).where(user_id: current_user.id).count
    
    if @review.valid?
      if review_count < 1
        @review.save
        flash[:notice] = "レビューを投稿しました"
        redirect_to shop_path(@review.shop.id)
      else
        flash[:notice] = "レビューの投稿は一度までです！"
        redirect_to shop_path(@review.shop.id)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reviewed_shops = current_user.reviewed_shops
  end

  private

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

  def review_params
    params.require(:review).permit(:visit_date, :comment, :image).merge(
                                   user_id: current_user.id, shop_id: params[:shop_id])
  end
end
