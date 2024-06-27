class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    search
  end

  private

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end
end
