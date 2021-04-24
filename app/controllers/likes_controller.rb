class LikesController < ApplicationController
  def create
    @like = current_user.like.create(cooking_id: params[:cooking_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(cooking_id: params[:cooking_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
