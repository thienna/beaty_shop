class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.page params[:page]
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
