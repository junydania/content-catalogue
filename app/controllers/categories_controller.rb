class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      redirect_to categories_path
      flash[:notice] = "Category successfully created!"
    else
      render new
    end
  end

  private

  def category_param
    params.require(:category).permit(:category_name)
  end
end
