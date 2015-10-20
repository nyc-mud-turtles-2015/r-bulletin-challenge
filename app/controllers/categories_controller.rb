class CategoriesController < ApplicationController

  # before_action @category = Category.find_by(params[:id])

  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    @topics = category.topics
    render '/topics/index'
  end
end
