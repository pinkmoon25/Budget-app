class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      flash.now[:alert] = @category.errors.first.message
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @total = @category.payments.sum(:amount)
    @transactions = @category.payments.order(created_at: :desc)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category removed successfully'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
