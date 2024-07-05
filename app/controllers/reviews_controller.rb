class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_shop, except: :index

  def new
    @review = @shop.reviews.new
    @review.shop_id = @shop.id
    review_count = Review.where(shop_id: params[:shop_id]).where(user_id: current_user.id).count
    unless review_count < 1
      flash[:notice] = "レビューの投稿は一度までです！"
      redirect_to shop_path(@shop)
    end
  end

  def create
    @review = @shop.reviews.new(review_params)
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to shop_path(@shop)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reviewed_shops = current_user.reviewed_shops
  end

  def destroy
    @review = @shop.reviews.find(params[:id])
    if @review.destroy
      flash[:notice] = "レビューを削除しました"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "問題が起きて削除できませんでした"
      redirect_to shop_path(@shop)
    end
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
