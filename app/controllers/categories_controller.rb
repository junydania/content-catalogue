class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    if @category.save
      flash[:notice] = "Category successfully created!"
      redirect_to new_category_path
    else
      flash[:notice]= "Sorry! You must enter a category"
      redirect_to new_category_path
    end
  end

  private

  def category_param
    params.require(:category).permit(:category_name)
  end
end


