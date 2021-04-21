class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cooking = @user.cookings.includes(:user)
  end
end
