class UsersController < ApplicationController
  def show
    @user = User.all(params[:id])
  end
end
