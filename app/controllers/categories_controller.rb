class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  private
  
  def category_params
    params.require(:category).permit(:name, :description)
  end

end