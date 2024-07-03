class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop

  def create
    @favorite = current_user.favorites.build(shop_id: params[:shop_id])
    @favorite.save
    # if @favorite.save
    #   respond_to do |format|
    #     format.html { redirect_to @shop }
    #     format.turbo_stream
    #   end
    render partial: 'favorites/favorite', locals: { shop: @shop }
    # else 
    #   redirect_to root_path
    # end
  end

  def destroy
    @favorite = Favorite.find_by(shop_id: params[:shop_id], user_id: current_user.id)
    @favorite.destroy
    # if @favorite.destroy
    #   respond_to do |format|
    #     format.html { redirect_to @shop }
    #     format.turbo_stream
    #   end
    render partial: 'favorites/favorite', locals: { shop: @shop }
    # else
    #   redirect_to root_path
    # end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
