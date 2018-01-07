class Admin::ProductsController < Admin::BaseController
  attr_reader :product, :search

  before_action :load_categories, only: %i(new edit)
  before_action :find_product, only: %i(edit update destroy)

  def index
    @categories = Category.all
    @search = Product.newest.ransack params[:q]
    @products = search.result.page params[:page]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if product.save
      create_success
    else
      flash.now[:warning] = t "admin_page.products.action.create.failed"
      load_categories
      render :new
    end
  end

  def edit; end

  def update
    if product.update_attributes product_params
      flash[:success] = t "admin_page.products.action.update.success"
      redirect_to admin_products_path
    else
      flash.now[:warning] = t "admin_page.products.action.update.failed"
      render :edit
    end
  end

  def destroy
    if product.destroy
      flash[:success] = t "admin_page.products.action.destroy.success"
    else
      flash.now[:warning] = t "admin_page.products.action.destroy.failed"
    end
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit Product::ATTRIBUTES
  end

  def find_product
    return if (@product = Product.find_by id: params[:id])
    flash[:danger] = t "admin_page.products.find_failed"
    redirect_to admin_products_path
  end

  def load_categories
    @categories = Category.all
  end

  def create_success
    flash[:success] = t "admin_page.products.action.create.success"
    redirect_to admin_products_path
  end
end
