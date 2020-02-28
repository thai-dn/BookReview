class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params['id'])

    redirect_to root_path unless @category

    @books = Book.where(category_id: @category.id).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def update
    @category = Category.find_by(id: params['id'])
    if @category.update(category_params)
      redirect_to root_path
      return
    end

    render 'show'
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