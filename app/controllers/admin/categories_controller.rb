class Admin::CategoriesController < Admin::BaseController
  attr_reader :category

  before_action :find_category, only: %i(edit update destroy)

  def index
    @categories = Category.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if category.save
      flash[:success] = t "admin_page.categories.action.create.success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "admin_page.categories.action.create.failed"
      render :new
    end
  end

  def edit; end

  def update
    if category.update_attributes category_params
      flash[:success] = t "admin_page.categories.action.update.success"
      redirect_to admin_categories_path
    else
      flash.now[:danger] = t "admin_page.categories.action.update.failed"
      render :edit
    end
  end

  def destroy
    if category.destroy
      flash[:success] = t "admin_page.categories.action.destroy.success"
    else
      flash[:warning] = "admin_page.categories.action.destroy.failed"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit Category::ATTRIBUTES
  end

  def find_category
    return if (@category = Category.find_by id: params[:id])
    flash[:danger] = t "admin_page.categories.find_failed"
    redirect_to admin_categories_path
  end
end
