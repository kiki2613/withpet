class SearchsController < ApplicationController
  def index
    search
  end

  def search
    @q = Shop.ransack(params[:q] || {})
    @shops = @q.result(distinct: true)
  end
end
