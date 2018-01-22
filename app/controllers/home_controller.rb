class HomeController < ApplicationController
  attr_reader :search

  before_action :load_support, :find_products_by_cate, only: :index

  def index
    ransack_params = params[:q]
    @searching_params = ransack_params ? ransack_params[:name_cont] : nil
    @products = search.result.page(params[:page]).per Settings.product.per_page
  end

  private

  def load_support
    @support = Supports::ProductSupport.new
  end

  def find_products_by_cate
    params_cate = params[:category]
    return unless params_cate
    category = Category.find_by id: params_cate
    return @search = category.products.newest.ransack(params[:q]) if category
    flash[:warning] = t "admin_page.categories.nothing"
  end
end
