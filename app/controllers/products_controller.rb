class ProductsController < ApplicationController
  before_action :load_support, only: :show

  def show
    @product = Product.find_by id: params[:id]
  end

  private

  def load_support
    @support = Supports::ResourcesSupport.new
  end
end
