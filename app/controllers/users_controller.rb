class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :current_user?
 
  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def current_user?
    unless current_user == @user
      redirect_to root_path
    end
  end
end
