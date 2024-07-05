class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_shop,          except: :index
  before_action :find_review,        only:   [:destroy, :edit, :update]
  before_action :moved_shop_page,    only:   [:destroy, :edit]

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
      flash.now[:notice] = "問題が起きて投稿できませんでした"
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
      flash.now[:notice] = "問題が起きて削除できませんでした"
      redirect_to shop_path(@shop)
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました"
      redirect_to shop_path(@shop)
    else
      flash.now[:notice] = "問題が起きて編集できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def moved_shop_page
    unless current_user.id == @review.user.id
      redirect_to shop_path(@shop)
    end
  end

  def review_params
    params.require(:review).permit(:visit_date, :comment, :image).merge(
                                   user_id: current_user.id, shop_id: params[:shop_id])
  end
end
