class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    category = Category.find_by(id: params[:id])
    @topics = category.topics
    redirect_to category_topics_path(category)
  end
end
