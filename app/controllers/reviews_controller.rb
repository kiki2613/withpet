class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_shop

  def new
    @review = @shop.reviews.new
  end

  def create
    @reviews = Review.new(review_params)

    if @reviews.save
      redirect_to shop_path(@reviews.shop.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_shop
    @shop = Shop.find(params[:shop_id])
  end

  def review_params
    params.require(:review).permit(:visit_date, 
                                   :comment).merge(user_id: current_user.id,
                                   shop_id: params[:shop_id])
  end
end
