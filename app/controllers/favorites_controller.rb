class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop

  def create
    @favorite = current_user.favorites.build(shop_id: params[:shop_id])
    @favorite.save
    render partial: 'favorites/favorite', locals: { shop: @shop }
  end

  def destroy
    @favorite = Favorite.find_by(shop_id: params[:shop_id], user_id: current_user.id)
    @favorite.destroy
    render partial: 'favorites/favorite', locals: { shop: @shop }
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
