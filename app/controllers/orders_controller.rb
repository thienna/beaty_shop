class OrdersController < ApplicationController
  attr_reader :order

  before_action :check_cart

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    order.total_price = current_cart_total_price

    if order.save
      order.send_order_information
      session.delete :cart
      flash[:success] = t "home_page.w_thank"
      redirect_to root_path
    else
      flash.now[:warning] = t "admin_page.orders.action.create.failed"
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit Order::ATTRIBUTES
  end

  def check_cart
    return unless current_cart.empty?
    flash[:info] = t "home_page.cart.nothing"
    redirect_back fallback_location: root_path
  end
end
