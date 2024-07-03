class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reviews = Review.create(review_params)
    redirect_to shop_path(@reviews.shop.id)
  end

  private

  def review_params
    params.require(:review).permit(:visit_date, 
                                   :comment).merge(user_id: current_user.id,
                                   shop_id: params[:shop_id])
  end
end
