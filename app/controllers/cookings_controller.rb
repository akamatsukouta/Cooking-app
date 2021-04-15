class CookingsController < ApplicationController

  def index
    @cooking = Cooking.order("created_at DESC")
  end

  def new
    @cooking = Cooking.new
  end

  def create
  end
end
