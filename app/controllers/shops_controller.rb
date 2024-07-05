class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    search
  end

  def show
    @shop = Shop.find(params[:id])
    @review = Review.new
    @reviews = @shop.reviews.all
  end

  private

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end
end
