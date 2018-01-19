class HomeController < ApplicationController
  before_action :load_categories, only: :index

  def index
    @products = Product.newest.page(params[:page]).per Settings.product.per_page
  end

  private

  def load_categories
    @categories = Category.all
  end
end
